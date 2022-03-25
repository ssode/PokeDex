//
//  ContentView.swift
//  PokeDex
//
//  Created by Jerry Cox on 3/22/22.
//

import SwiftUI
import Combine


struct ContentView: View {
    @ObservedObject var network: Network
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults) { pokemon in
               //     NavigationLink(destination: PokemonDetailView(network: Network())) {
                        HStack {
                            AsyncImage(url: URL(string: pokemon.sprites.frontDefault)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)

                            } placeholder: {
                                Color.gray.opacity(0.5)
                                    .frame(width: 100, height: 100)
                            }
                            Text((pokemon.name.fixSuffix(pokemon.name).capitalizingFirstLetter()))
                    }
                }
            }
            .listStyle(InsetListStyle())
            .navigationTitle("PokeDex")
        }
        .onAppear {
            network.fetchPokemon()
        }
        .searchable(text: $searchText, prompt: "Search a Pokémon")
        .disableAutocorrection(true)
            
    }
    var searchResults: [Details] {
        if searchText.isEmpty {
            return [network.details]
        } else {
            return [network.details].filter { $0.name.contains(searchText.lowercased()) }
        }
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(network: Network(details: Details.example, results: Results.example))
    }
}
