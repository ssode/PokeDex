//
//  DetailButtonView.swift
//  PokeDex
//
//  Created by Jerry Cox on 3/28/22.
//

import SwiftUI

struct DetailButtonStyle: ButtonStyle {
    let color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? .black : self.color)
            .background(configuration.isPressed ? self.color : .white)
            .clipShape(Capsule())
           

    }
}

struct DetailButtonView: View {
    var body: some View {
        Button {
            print("Example button")
        } label: {
            Text("Example")
        }
    //    .buttonStyle(DetailButtonStyle(color: Color.grass))
    }
}

struct DetailButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DetailButtonView()
    }
}
