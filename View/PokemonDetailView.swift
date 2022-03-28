//
//  PokemonDetailView.swift
//  PokeDex
//
//  Created by Jerry Cox on 3/23/22.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var network: Network

    
    var body: some View {
        ZStack {
            Color.grass
                .ignoresSafeArea()
            
            ScrollView {
                ZStack {
                    RoundedRectangle(cornerRadius: 35)
                        .frame(maxHeight: .infinity)
                        .foregroundColor(.white)
                        .offset(y: 150)
                        .shadow(radius: 10)
                    
                    VStack {
                        AsyncImage(url: URL(string: network.details.sprites.other.officialArtwork.frontdefault)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 135, height: 135)
                            
                        } placeholder: {
                            Color.gray.opacity(0.5)
                                .frame(width: 135, height: 135)
                        }
                        Text(network.details.name.fixSuffix(network.details.name).capitalizingFirstLetter())
                            .font(.title)
                        
                        HStack {
                            Text("Height: \(network.details.height) m")
                                .padding([.trailing, .leading], 10)
                            Text("Weight: \(network.details.weight) kg")
                                .padding([.trailing, .leading], 10)
                        }
                        .font(.caption)
                        .foregroundColor(.secondary)
                        
                        HStack {
                            ForEach(network.details.types, id: \.self) { type in
                                Capsule()
                                    .foregroundColor(.grass
                                    )
                                    .frame(width: 100, height: 30)
                                    .overlay(
                                        Text(type.name.capitalizingFirstLetter())
                                            .font(.caption)
                                    )
                                    .padding(3)
                            }
                        }
                        .padding(.bottom, 10)
                        
                        HStack {
                            Button("Overview") {
                                // switch to view that contains description, abilities and stats
                            }
                            Spacer()
                            Button("Evolution") {
                                // switch to evolution tree
                            }
                            Spacer()
                            Button("Moves") {
                                // switch to list of moves
                            }
                        }
                        .padding([.leading, .trailing], 40)
                        
                        VStack(alignment: .leading) {
                            Text("ABILITIES:")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .padding(.top)
                                .padding(.bottom, 2)
                       
                            ForEach(network.details.abilities, id: \.self) { ability in
                                Text(ability.name)
                                    .padding(1)
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            Text("STATS:")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .padding(.leading)
                            Spacer()
                        }
                        StatBarView()
                        
                    }
                    .offset(y: 60)
                }
            }
        }
    }
}


struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView()
    }
}
