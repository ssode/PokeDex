//
//  Species.swift
//  PokeDex
//
//  Created by Jerry Cox on 3/31/22.
//

import Foundation
struct SpeciesDetail: Decodable, Hashable {
    let evolutionChain: EvolutionChain
    let flavorTextEntries: [FlavorTextEntry]
    
    static let example = SpeciesDetail(evolutionChain: EvolutionChain(url: "https://pokeapi.co/api/v2/evolution-chain/1/"), flavorTextEntries: [])
}

struct EvolutionChain: Decodable, Hashable {
    let url: String
}

struct FlavorTextEntry: Decodable, Hashable {
    let flavorText: String
}
