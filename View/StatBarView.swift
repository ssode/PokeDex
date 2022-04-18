//
//  StatBarView.swift
//  PokeDex
//
//  Created by Jerry Cox on 3/28/22.
//

import SwiftUI

struct StatBarView: View {
    @EnvironmentObject var network: Network
    
    var body: some View {
        VStack {
            ForEach(network.details.stats, id: \.self) { stat in
                HStack {
                    Text(stat.stat.name.adjustStats(stat.stat.name))
                        .font(.system(size: 9))
                    ProgressView(value: (CGFloat(stat.baseStat) * 1.5), total: 225)
                        .frame(height: 25)
                        .tint(colorType)
                       
                    Text("\(stat.baseStat)")
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding([.leading, .trailing])
                .font(.system(size: 9))
            }
        }
    }
    var colorType: Color {
        let types = network.details.types
        if types.first == (TypeElement(type: Species(name: "normal", url: "https://pokeapi.co/api/v2/type/1/"))) {
            return Color.normal
        } else if types.first == (TypeElement(type: Species(name: "fighting", url: "https://pokeapi.co/api/v2/type/2/"))) {
            return Color.fighting
        } else if types.first == (TypeElement(type: Species(name: "flying", url: "https://pokeapi.co/api/v2/type/3/"))) {
            return Color.flying
        } else if types.first == (TypeElement(type: Species(name: "poison", url: "https://pokeapi.co/api/v2/type/4/"))) {
            return Color.poison
        } else if types.first == (TypeElement(type: Species(name: "ground", url: "https://pokeapi.co/api/v2/type/5/"))) {
            return Color.ground
        } else if types.first == (TypeElement(type: Species(name: "rock", url: "https://pokeapi.co/api/v2/type/6/"))) {
            return Color.rock
        } else if types.first == (TypeElement(type: Species(name: "bug", url: "https://pokeapi.co/api/v2/type/7/"))) {
            return Color.bug
        } else if types.first == (TypeElement(type: Species(name: "ghost", url: "https://pokeapi.co/api/v2/type/8/"))) {
            return Color.ghost
        } else if types.first == (TypeElement(type: Species(name: "steel", url: "https://pokeapi.co/api/v2/type/9/"))) {
            return Color.steel
        } else if types.first == (TypeElement(type: Species(name: "fire", url: "https://pokeapi.co/api/v2/type/10/"))) {
            return Color.fire
        } else if types.first == (TypeElement(type: Species(name: "water", url: "https://pokeapi.co/api/v2/type/11/"))) {
            return Color.water
        } else if types.first == (TypeElement(type: Species(name: "grass", url: "https://pokeapi.co/api/v2/type/12/"))) {
            return Color.grass
        } else if types.first == (TypeElement(type: Species(name: "electric", url: "https://pokeapi.co/api/v2/type/13/"))) {
            return Color.electric
        } else if types.first == (TypeElement(type: Species(name: "psychic", url: "https://pokeapi.co/api/v2/type/14/"))) {
            return Color.psychic
        } else if types.first == (TypeElement(type: Species(name: "ice", url: "https://pokeapi.co/api/v2/type/15/"))) {
            return Color.ice
        } else if types.first == (TypeElement(type: Species(name: "dragon", url: "https://pokeapi.co/api/v2/type/16/"))) {
            return Color.dragon
        } else if types.first == (TypeElement(type: Species(name: "dark", url: "https://pokeapi.co/api/v2/type/17/"))) {
            return Color.dark
        } else if types.first == (TypeElement(type: Species(name: "fairy", url: "https://pokeapi.co/api/v2/type/18/"))) {
            return Color.fairy
        }
        return Color.clear
    }
}

struct StatBarView_Previews: PreviewProvider {
    static var previews: some View {
        StatBarView()
    }
}
