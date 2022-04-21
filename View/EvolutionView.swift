//
//  EvolutionView.swift
//  PokeDex
//
//  Created by Jerry Cox on 3/31/22.
//

import SwiftUI

struct EvolutionView: View {
    @EnvironmentObject var network: Network
    var speciesDetail: SpeciesDetail
    
    var body: some View {
        HStack {
            VStack {
                AsyncImage(url: URL(string: network.details.sprites.other.officialArtwork.frontDefault)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 75, height: 75)
                } placeholder: {
                    Color.gray.opacity(0.5)
                        .frame(width: 75, height: 75)
                }
                Text(network.evolution.chain.species.name.capitalizingFirstLetter())
            }
            Image(systemName: "arrow.right")
            ForEach(network.evolution.chain.evolvesTo, id: \.self) { pokemon in
                VStack {
                    AsyncImage(url: URL(string: network.details.sprites.other.officialArtwork.frontDefault)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 75, height: 75)
                    } placeholder: {
                        Color.gray.opacity(0.5)
                            .frame(width: 75, height: 75)
                    }
                    
                    Text(pokemon.species.name.capitalizingFirstLetter())
                }
                ForEach(pokemon.evolvesTo, id: \.self) { evolution in
                    Image(systemName: "arrow.right")
                    VStack {
                        AsyncImage(url: URL(string: network.details.sprites.other.officialArtwork.frontDefault)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 75, height: 75)
                        } placeholder: {
                            Color.gray.opacity(0.5)
                                .frame(width: 75, height: 75)
                        }
                        Text(evolution.species.name.capitalizingFirstLetter())
                    }
                }
            }
        }
        .onAppear {
            network.fetchEvolution(url: network.speciesDetail)
        }
        .padding(.top)
    }
}


struct EvolutionView_Previews: PreviewProvider {
    static var previews: some View {
        EvolutionView(speciesDetail: SpeciesDetail.example)
    }
}
