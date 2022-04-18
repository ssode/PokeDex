//
//  WeaknessView.swift
//  PokeDex
//
//  Created by Jerry Cox on 4/14/22.
//

import SwiftUI

struct WeaknessView: View {
    @EnvironmentObject var network: Network
    let weaknessCalculator = WeaknessCalculator()
    
    var rows = [GridItem(.adaptive(minimum: 20))]
    
    var body: some View {
        LazyHGrid(rows: rows, alignment: .center, spacing: 1) {
            ForEach(network.details.types, id: \.self) { weakness in
                ForEach(weaknessCalculator.calculateWeakness(pokemonType: weakness), id: \.self) { typeName in
                    Capsule()
                        .foregroundColor(CapsuleColor(color: typeName))
                        .frame(width: 100, height: 30)
                        .overlay(
                            Text(typeName.capitalizingFirstLetter())
                                .font(.caption)
                        )
                        .padding(3)
                    
                }
                .padding()
            }
        }
        .frame(width: 200, height: 100)
        .padding()
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
}

struct WeaknessView_Previews: PreviewProvider {
    static var previews: some View {
        WeaknessView()
    }
}
