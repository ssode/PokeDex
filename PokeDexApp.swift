//
//  PokeDexApp.swift
//  PokeDex
//
//  Created by Jerry Cox on 3/22/22.
//

import SwiftUI

@main 
struct PokeDexApp: App {
    var network = Network(details: Details.example)
    
    var body: some Scene {
        WindowGroup {
            ContentView(network: network)
                .environmentObject(network)
        }
    }
}
