//
//  DescriptionView.swift
//  PokeDex
//
//  Created by Jerry Cox on 3/31/22.
//

import SwiftUI

struct DescriptionView: View {
    @EnvironmentObject var network: Network
    var details: Details
    
    var body: some View {
        Text(EntryText.removeN(EntryText))
            .multilineTextAlignment(.center)
            .font(.callout)
            .foregroundColor(.secondary)
            .onAppear {
                network.fetchSpecies(url: details.species)
            }
            .padding(.bottom, 5)
    }
    
    var EntryText: String {
        let entries = network.speciesDetail.flavorTextEntries
        if entries.isEmpty == false {
            let description = entries[3]
            let flavorText = description.flavorText
        return flavorText
        }
        return ""
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(details: Details.example)
    }
}
