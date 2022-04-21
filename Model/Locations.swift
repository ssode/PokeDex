//
//  Locations.swift
//  PokeDex
//
//  Created by Jerry Cox on 4/20/22.
//

import Foundation

struct Locations: Decodable, Hashable {
    let locationArea: LocationArea
    
    enum CodyingKeys: String, CodingKey {
        case locationArea = "location_area"
    }
    
    static let example = Locations(locationArea: LocationArea(name: ""))
}

struct LocationArea: Decodable, Hashable {
    var name: String
}
