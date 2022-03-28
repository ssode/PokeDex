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
                     //   .font(.system(size: 9))
                    ProgressView(value: (CGFloat(stat.baseStat) * 1.5), total: 225)
                        .frame(height: 25)
                        .tint(Color.grass)
                       
                    Text("\(stat.baseStat)")
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding([.leading, .trailing])
                .font(.system(size: 12))
            }
        }
    }
}

struct StatBarView_Previews: PreviewProvider {
    static var previews: some View {
        StatBarView()
    }
}
