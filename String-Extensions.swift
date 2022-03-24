//
//  String-Extensions.swift
//  PokeDex
//
//  Created by Jerry Cox on 3/23/22.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    func fixSuffix(_ text: String) -> String {
        if text.hasSuffix("-m") {
            let newText = text.replacingOccurrences(of: "-m", with: "♂")
            return newText
        } else if text.hasSuffix("-f") {
            let newText = text.replacingOccurrences(of: "-f", with: "♀")
            return newText
        } else if text.hasSuffix("-jr") {
            let newText = text.replacingOccurrences(of: "-jr", with: " jr")
            return newText
        } else if text.hasSuffix("-altered") {
            let newText = text.replacingOccurrences(of: "-altered", with: "")
            return newText
        } else if text.hasSuffix("-land") {
            let newText = text.replacingOccurrences(of: "-land", with: "")
            return newText
        } else if text.hasSuffix("-standard") {
            let newText = text.replacingOccurrences(of: "-standard", with: "")
            return newText
        } else if text.hasSuffix("-incarnate") {
            let newText = text.replacingOccurrences(of: "-incarnate", with: "")
            return newText
        } else if text.hasSuffix("-average") {
            let newText = text.replacingOccurrences(of: "-average", with: "")
            return newText
        } else if text.hasSuffix("-striped") {
            let newText = text.replacingOccurrences(of: "-striped", with: "")
            return newText
        } else if text.hasSuffix("-land") {
            let newText = text.replacingOccurrences(of: "-land", with: "")
            return newText
        } else if text.hasSuffix("-50") {
            let newText = text.replacingOccurrences(of: "-50", with: "")
            return newText
        } else if text.hasSuffix("-male") {
            let newText = text.replacingOccurrences(of: "-male", with: "")
            return newText
        } else if text.hasSuffix("-aria") {
            let newText = text.replacingOccurrences(of: "-aria", with: "")
            return newText
        } else if text.hasSuffix("-shield") {
            let newText = text.replacingOccurrences(of: "-shield", with: "")
            return newText
        } else if text.hasSuffix("-ordinary") {
            let newText = text.replacingOccurrences(of: "-ordinary", with: "")
            return newText
        } else if text.hasSuffix("-normal") {
            let newText = text.replacingOccurrences(of: "-normal", with: "")
            return newText
        } else if text.hasSuffix("-plant") {
            let newText = text.replacingOccurrences(of: "-plant", with: "")
            return newText
        } else if text.hasSuffix("-red") {
            let newText = text.replacingOccurrences(of: "-red", with: "")
            return newText
        }
        return text
    }
//        guard self.hasSuffix(suffix) else { return self }
//        return String(self.dropFirst(suffix.count))
//    }
}
