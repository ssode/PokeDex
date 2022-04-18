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
            Text(network.evolution.chain.species.name)
            ForEach(network.evolution.chain.evolvesTo, id: \.self) { pokemon in
                Text(pokemon.species.name)
                ForEach(pokemon.evolvesTo, id: \.self) { evolution in
                    Text(evolution.species.name)
                }
            }
        }
        .onAppear {
            network.fetchEvolution(url: network.speciesDetail)
        }
    }
}


struct EvolutionView_Previews: PreviewProvider {
    static var previews: some View {
        EvolutionView(speciesDetail: SpeciesDetail.example)
    }
}
