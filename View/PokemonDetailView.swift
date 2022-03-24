//
//  PokemonDetailView.swift
//  PokeDex
//
//  Created by Jerry Cox on 3/23/22.
//

import SwiftUI

struct PokemonDetailView: View {
    @ObservedObject var network: Network
    
    var body: some View {
        VStack {
          //  Text(name.fixSuffix(name).capitalizingFirstLetter())
          //  Text(pokemon.name)
        }
    }
}


struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(network: Network(details: Details.example))
    }
}
