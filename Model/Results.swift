//
//  Results.swift
//  PokeDex
//
//  Created by Jerry Cox on 3/24/22.
//

import Foundation

struct Results: Hashable, Decodable {
   // var id = UUID()
    var results: [Result]
    
    static let example = Results(results: [
        Result(name: "Bulbasuar", url: URL(string: "https://pokeapi.co/api/v2/pokemon/1/")!),
        Result(name: "Ivysaur", url: URL(string: "https://pokeapi.co/api/v2/pokemon/2/")!)
    ])
}

struct Result: Hashable, Decodable {
   // var id = UUID()
    let name: String
    let url: URL
    
    static let example = Result(name: "Bulbasuar", url: URL(string: "https://pokeapi.co/api/v2/pokemon/1/")!)
}
