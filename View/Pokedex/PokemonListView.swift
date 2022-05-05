//
//  PokemonListView.swift
//  PokeDex
//
//  Created by Jerry Cox on 4/25/22.
//

import SwiftUI

struct PokemonListView: View {
    @EnvironmentObject var network: Network
    @State private var searchText = ""
    
    var body: some View {
        List {
            ForEach(searchResults, id: \.self) { pokemon in
                NavigationLink(destination: PokemonDetailView(result: pokemon)) {
                    HStack {
                        Image("\(pokemon.url.urlIndex(url: pokemon.url))")
                        Text((pokemon.name.fixSuffix(pokemon.name).capitalizingFirstLetter()))
                    }
                }
            }
        }
        .environment(\.defaultMinListRowHeight, 65)
        .listStyle(InsetListStyle())
        .navigationTitle("PokeDex")
        .searchable(text: $searchText, prompt: "Search a Pokémon")
        .disableAutocorrection(true)
        
        
    }
    var searchResults: [Result] {
        let allResults = network.results.results
        if searchText.isEmpty {
            return allResults
        } else {
            return allResults.filter { $0.name.contains(searchText.lowercased()) }
        }
    }  
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
