//
//  ContentView.swift
//  PokeDex
//
//  Created by Jerry Cox on 3/22/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var network: Network
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: PokemonListView()) {
                Text("PokeDex")
            }
            .navigationTitle("PokePocket")
        }
        .onAppear {
            network.fetchPokemon()
        }
    }    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
