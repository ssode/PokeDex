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
            VStack(spacing: 25) {
                NavigationLink(destination: PokemonListView()) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.water)
                            .shadow(radius: 2)
                        Image("pokeballGraphic")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .opacity(0.15)
                            .rotationEffect(Angle(degrees: 45.0))
                            .offset(x: 90, y: -25)
        
                        HStack {
                            Text("Pokédex")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                        }
                    }
                    .frame(width: 315, height: 175)
        
                }
//                NavigationLink(destination: WhosThatPokemonView()) {
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 15)
//                            .foregroundColor(.fire)
//                            .shadow(radius: 2)
//                        Image("pokeballGraphic")
//                            .resizable()
//                            .scaledToFit()
//                            .foregroundColor(.gray)
//                            .frame(width: 100, height: 100)
//                            .opacity(0.2)
//                            .rotationEffect(Angle(degrees: 45.0))
//                        HStack {
//                            Text("PokéQuiz")
//                                .foregroundColor(.white)
//                                .font(.largeTitle)
//                                .fontWeight(.bold)
//                        }
//                    }
//                }
//                .frame(width: 315, height: 175)
//                Spacer()
            }
            .padding()
            .navigationTitle("PokePocket")
        }
        .onAppear {
           // network.fetchPokemon()
            network.fetchResults()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
