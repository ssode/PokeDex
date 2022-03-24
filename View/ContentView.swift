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
    
    @State private var requests = Set<AnyCancellable>()
    @State private var details = [Details]()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(details, id: \.self) { pokemon in
               //     NavigationLink(destination: PokemonDetailView(network: Network())) {
                        HStack {
//                            AsyncImage(url: URL(string: network.pokemon.sprites?.frontDefault ?? "")) { image in
//                                image
//                                    .resizable()
//                                    .frame(width: 100, height: 100)
//
//                            } placeholder: {
//                                Color.gray.opacity(0.5)
//                                    .frame(width: 100, height: 100)
//                            }
                            Text((pokemon.name.fixSuffix(pokemon.name).capitalizingFirstLetter()))
                      //  }
                    }
                }
            }
            .listStyle(InsetListStyle())
            .navigationTitle("PokeDex")
        }
        .onAppear {
            network.fetch(URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=721")!, defaultValue: [URL]())
                .flatMap { results in
                    results.publisher.flatMap { url in
                        network.fetch(url, defaultValue: [Details]())
                    }
                }
                .collect()
                .sink { values in
                    let allDetails = values.joined()
                    details = allDetails.sorted { $0.id > $1.id }
                }
                .store(in: &requests)
        }
        .searchable(text: $searchText, prompt: "Search a Pokémon")
        .disableAutocorrection(true)
            
    }
//    var searchResults: [String] {
//        if searchText.isEmpty {
//            return network.details.name
//        } else {
//            return network.details.filter { $0.contains(searchText.lowercased()) }
//        }
//    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(network: Network(details: Details.example))
    }
}
