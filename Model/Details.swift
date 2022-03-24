//
//  Details.swift
//  PokeDex
//
//  Created by Jerry Cox on 3/24/22.
//

import Foundation

struct Details: Identifiable, Decodable, Hashable {
    var abilities: [Ability]
    var baseExperience: Int
    var forms: [Forms]
    var height: Int
    var id: Int
    var moves: [Move]
    var name: String
    var order: Int
    var species: Species
    var sprites: Sprites
    var stats: [Stat]
    var types: [TypeElement]
    var weight: Int
    
    static let example = Details(
        abilities: [
            Ability(name: "Overgrow", url: "https://pokeapi.co/api/v2/ability/65/"),
            Ability(name: "Chlorophyll", url: "https://pokeapi.co/api/v2/ability/34/")
        ],
        baseExperience: 1,
        forms: [],
        height: 7,
        id: 001,
        moves: [
            Move(move: MoveDetail(name: "Razor Wind", url: "https://pokeapi.co/api/v2/move/13/"), versionGroupDetails: [VersionGroupDetail(levelLearnedAt: 0)]),
            Move(move: MoveDetail(name: "Vine Whip", url: "https://pokeapi.co/api/v2/move/22/"), versionGroupDetails: [VersionGroupDetail(levelLearnedAt: 13)]),
            Move(move: MoveDetail(name: "Tackle", url: "https://pokeapi.co/api/v2/move/33/"), versionGroupDetails: [VersionGroupDetail(levelLearnedAt: 1)]),

        ],
        name: "Bulbasaur",
        order: 1,
        species: Species(url: "https://pokeapi.co/api/v2/pokemon-species/1/"),
        sprites: Sprites(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"),
        stats: [
            Stat(baseStat: 45, stat: StatDetail(name: "HP=P")),
            Stat(baseStat: 49, stat: StatDetail(name: "Attack")),
            Stat(baseStat: 49, stat: StatDetail(name: "Defense")),
            Stat(baseStat: 65, stat: StatDetail(name: "Special Attack")),
            Stat(baseStat: 65, stat: StatDetail(name: "Special Defense")),
            Stat(baseStat: 45, stat: StatDetail(name: "Speed")),
        ],
        types: [
            TypeElement(name: "grass"),
            TypeElement(name: "posion")
        ],
        weight: 69)
}

struct Ability: Hashable, Decodable {
    var name: String
    var url: String
}

struct Forms: Decodable, Hashable {
    var name: String
    var url: String
}

struct Species: Hashable, Decodable {
    var url: String
}

struct Sprites: Hashable, Decodable {
    var frontDefault: String
    
}

struct Move: Decodable, Hashable {
    var move: MoveDetail
    var versionGroupDetails: [VersionGroupDetail]
}

struct MoveDetail: Decodable, Hashable {
    var name: String
    var url: String
}

struct VersionGroupDetail: Decodable, Hashable {
    var levelLearnedAt: Int
}

struct Stat: Decodable, Hashable {
    var baseStat: Int
    var stat: StatDetail
}

struct StatDetail: Decodable, Hashable {
    var name: String
}

struct TypeElement: Decodable, Hashable {
    var name: String
}