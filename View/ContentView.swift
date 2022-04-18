//
//  ContentView.swift
//  PokeDex
//
//  Created by Jerry Cox on 3/22/22.
//

import SwiftUI
import Combine


struct ContentView: View {
    @EnvironmentObject var network: Network
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults, id: \.self) { pokemon in
                    NavigationLink(destination: PokemonDetailView(result: pokemon)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text((pokemon.name.fixSuffix(pokemon.name).capitalizingFirstLetter()))
                            }
                        }
                    }
                }
            }
            .environment(\.defaultMinListRowHeight, 65)
            .listStyle(InsetListStyle())
            .navigationTitle("PokeDex")
            
        }
        .onAppear {
            network.fetchPokemon()
        }
        .searchable(text: $searchText, prompt: "Search a Pokémon")
        .disableAutocorrection(true)
            
    }
    var searchResults: [Result] {
        if searchText.isEmpty {
            return network.results.results
        } else {
            return network.results.results.filter { $0.name.contains(searchText.lowercased()) }
        }
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
