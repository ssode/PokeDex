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
            VStack {
                VStack {
                    Image("\(network.evolution.chain.species.url.speciesURL(url: network.evolution.chain.species.url))")
                        .frame(width: 75, height: 75)
                    Text(network.evolution.chain.species.name.capitalizingFirstLetter())
                }
                Image(systemName: "arrow.down")
                ForEach(network.evolution.chain.evolvesTo, id: \.self) { pokemon in
                    VStack {
                        Image("\(pokemon.species.url.speciesURL(url: pokemon.species.url))")
                            .frame(width: 75, height: 75)
                        Text(pokemon.species.name.capitalizingFirstLetter())
                    }
                    ForEach(pokemon.evolvesTo, id: \.self) { evolution in
                        Image(systemName: "arrow.down")
                        VStack {
                            Image("\(evolution.species.url.speciesURL(url: evolution.species.url))")
                                .frame(width: 75, height: 75)
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
