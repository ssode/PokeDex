//
//  Details.swift
//  PokeDex
//
//  Created by Jerry Cox on 3/24/22.
//
//

import SwiftUI

struct Details: Identifiable, Decodable, Hashable {
    let abilities: [Ability]
    let baseExperience: Int
    let forms: [Species]
    let height: Int
    let id: Int
    let locationAreaEncounters: String
    let moves: [Move]
    let name: String
    let order: Int
    let species: Species
    let sprites: Sprites
    let stats: [Stat]
    let types: [TypeElement]
    let weight: Int
    
    enum codingKeys: String, CodingKey {
        case locationAreaEncounters = "location_area_encounters"
    }
    
    static let example = Details(
        abilities: [
            Ability(ability: Species(name: "Overgrow", url: "https://pokeapi.co/api/v2/pokemon-species/1/"), isHidden: false, slot: 1),
            Ability(ability: Species(name: "Chlorophyll", url: "https://pokeapi.co/api/v2/pokemon-species/1/"), isHidden: false, slot: 1)
    ],
        baseExperience: 16,
        forms: [],
        height: 7,
        id: 1,
        locationAreaEncounters: "",
        moves: [],
        name: "Bulbasaur",
        order: 1,
        species: Species(name: "Bulbasuar", url: "https://pokeapi.co/api/v2/pokemon-species/1/"),
        sprites: Sprites(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png", other: Other(officialArtwork: OfficialArtwork(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png"))),
        stats: [],
        types: [
            TypeElement(type: Species(name: "grass", url: "https://pokeapi.co/api/v2/pokemon-species/1/")),
            TypeElement(type: Species(name: "poision", url: "https://pokeapi.co/api/v2/pokemon-species/1/"))
        ],
        weight: 69
    )
}

// MARK: - Ability
struct Ability: Decodable, Hashable {
    let ability: Species
    let isHidden: Bool
    let slot: Int
}

struct Species: Decodable, Hashable {
    let name: String
    let url: String
}

struct GameIndex: Decodable, Hashable {
    let gameIndex: Int
    let version: Species
}

struct Move: Decodable, Hashable {
    let move: Species
    let versionGroupDetails: [VersionGroupDetail]
}

struct VersionGroupDetail: Decodable, Hashable {
    let levelLearnedAt: Int
    let moveLearnMethod, versionGroup: Species
}

class Sprites: Decodable, Hashable {
    static func == (lhs: Sprites, rhs: Sprites) -> Bool {
        lhs.frontDefault == rhs.frontDefault && lhs.other == rhs.other
    }
    
    let frontDefault: String
    let other: Other

    init(frontDefault: String, other: Other) {
        self.frontDefault = frontDefault
        self.other = other
            
        }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(frontDefault)
    }
}

struct Other: Decodable, Hashable {
    let officialArtwork: OfficialArtwork
    
    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

struct OfficialArtwork: Decodable, Hashable {
    let frontDefault: String
}

struct Stat: Decodable, Hashable {
    let baseStat, effort: Int
    let stat: Species
}

struct TypeElement: Decodable, Hashable {
    let type: Species
}
