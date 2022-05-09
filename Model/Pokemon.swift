//
//  Pokemon.swift
//  PokeDex
//
//  Created by Jerry Cox on 5/9/22.
//

import Foundation

struct Pokemon: Decodable {
    var species: Species
    var details: Details
    var evolution: Evolution
    var locations: [Locations]
}
