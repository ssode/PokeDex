//
//  PokemonDetailView.swift
//  PokeDex
//
//  Created by Jerry Cox on 3/23/22.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var network: Network
    @Namespace private var buttonAnimation
    @Environment(\.colorScheme) var colorScheme
    
    var result: Result
    
    var menuButtons = ["Overview", "Evolution", "Moves", "Weaknesses", "Locations"]
    @State private var selectedButton = 0
    
    var body: some View {
        ScrollView {
            ZStack {
                RoundedRectangle(cornerRadius: 35)
                    .frame(maxHeight: .infinity)
                    .foregroundColor(colorScheme == .dark ? .black : .white)
                    .offset(y: 150)
                    .shadow(radius: 10)
                
                VStack {
                    AsyncImage(url: URL(string: network.details.sprites.other.officialArtwork.frontDefault)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 135, height: 135)
                        
                    } placeholder: {
                        Color.gray.opacity(0.5)
                            .frame(width: 135, height: 135)
                    }
                    
                    VStack {
                        Text(network.details.name.fixSuffix(network.details.name).capitalizingFirstLetter())
                            .font(.title)
                        Text("#" + String(format: "%03d",network.details.id))
                            .foregroundColor(.secondary)
                            .font(.caption)
                    }
                    
                    DescriptionView(details: network.details)
                    
                    HStack {
                        Text("Height: \(Double(network.details.height) / 10.0, specifier: "%.1f") m")
                            .padding([.trailing, .leading], 10)
                        Text("Weight: \(Double(network.details.weight) / 10.0, specifier: "%.1f") kg")
                            .padding([.trailing, .leading], 10)
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)
                   
                    HStack {
                        ForEach(network.details.types, id: \.self) { type in
                            Capsule()
                                .foregroundColor(CapsuleColor(color: type.type.name))
                                .frame(width: 100, height: 30)
                                .overlay(
                                    Text(type.type.name.capitalizingFirstLetter())
                                        .font(.caption)
                                )
                                .padding(3)
                        }
                    }
                    .padding(.bottom, 10)
//
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(menuButtons.indices) { index in
                                if index == selectedButton {
                                    Text(menuButtons[index])
                                        .padding(.horizontal)
                                        .padding(.vertical, 4)
                                        .background(Capsule().foregroundColor(colorType))
                                        .foregroundColor(.white)
                                        .matchedGeometryEffect(id: "button", in: buttonAnimation)
                                } else {
                                    Text(menuButtons[index])
                                        .padding(.horizontal)
                                        .padding(.vertical, 4)
                                        .background(Capsule().foregroundColor(Color.clear))
                                        .foregroundColor(colorType)
                                        .onTapGesture {
                                            selectedButton = index
                                        }
                                }
                            }
                            .frame(height: 40)
                        }
                        .animation(.easeIn, value: selectedButton)
                    }
                    if selectedButton == 0 {
                        VStack(alignment: .leading) {
                            Text("ABILITIES:")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .padding(.top)
                                .padding(.bottom, 2)
                            Divider()
                            ForEach(network.details.abilities, id: \.self) { ability in
                                Text(ability.ability.name.removeDash(ability.ability.name).capitalizingFirstLetter())
                                    .padding(1)
                                Divider()
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
                            .padding(.bottom)

                    } else if selectedButton == 1 {
                        EvolutionView(speciesDetail: network.speciesDetail)

                    } else if selectedButton == 2 {
                        MovesView()

                    } else if selectedButton == 3 {
                        WeaknessView()

                    } else if selectedButton == 4 {
                        LocationView()
                    }
                }
                .offset(y: 60)
            }
        }
        .background(colorType)
        .onAppear {
            network.GetPokemonDetails(result: result)
        }
    }
    
    func CapsuleColor(color: String) -> Color {
            if color == "normal" {
                return .normal
            } else if color == "fighting" {
                return .fighting
            } else if color == "flying" {
                return .flying
            } else if color == "poison" {
                return .poison
            } else if color == "ground" {
                return .ground
            } else if color == "rock" {
                return .rock
            } else if color == "bug" {
                return .bug
            } else if color == "ghost" {
                return .ghost
            } else if color == "steel" {
                return .steel
            } else if color == "fire" {
                return .fire
            } else if color == "water" {
                return .water
            } else if color == "grass" {
                return .grass
            } else if color == "electric" {
                return .electric
            } else if color == "psychic" {
                return .psychic
            } else if color == "ice" {
                return .ice
            } else if color == "dragon" {
                return .dragon
            } else if color == "dark" {
                return .dark
            } else if color == "fairy" {
                return .fairy
            }
        return Color.clear
    }
    
    var colorType: Color {
        let typeName = network.details.types.map { $0.type.name }
        for type in typeName {
            if type == "normal" {
                return .normal
            } else if type == "fighting" {
                return .fighting
            } else if type == "flying" {
                return .flying
            } else if type == "poison" {
                return .poison
            } else if type == "ground" {
                return .ground
            } else if type == "rock" {
                return .rock
            } else if type == "bug" {
                return .bug
            } else if type == "ghost" {
                return .ghost
            } else if type == "steel" {
                return .steel
            } else if type == "fire" {
                return .fire
            } else if type == "water" {
                return .water
            } else if type == "grass" {
                return .grass
            } else if type == "electric" {
                return .electric
            } else if type == "psychic" {
                return .psychic
            } else if type == "ice" {
                return .ice
            } else if type == "dragon" {
                return .dragon
            } else if type == "dark" {
                return .dark
            } else if type == "fairy" {
                return .fairy
            }
        }
        return Color.clear
    }
}


struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(result: Result.example)
    }
}
