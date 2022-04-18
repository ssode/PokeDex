//
//  WeaknessCalculator.swift
//  PokeDex
//
//  Created by Jerry Cox on 4/14/22.
//

import Foundation

struct WeaknessCalculator {
    func calculateWeakness(pokemonType: TypeElement) -> [String] {
        let defenseType = pokemonType.type.name
        if defenseType == "normal" {
            let weaknesses = ["fighting"]
            return weaknesses
        } else if defenseType == "fire" {
                let weaknesses = ["water", "ground", "rock"]
                return weaknesses
        } else if defenseType == "water" {
            let weaknesses = ["electric", "grass", ]
            return weaknesses
        } else if defenseType == "electric" {
            let weaknesses = ["ground"]
            return weaknesses
        } else if defenseType == "grass" {
            let weaknesses = ["fire", "ice", "poison", "flying", "bug"]
            return weaknesses
        } else if defenseType == "fighting" {
            let weaknesses = ["flying", "psychic", "fairy"]
            return weaknesses
        } else if defenseType == "poison" {
            let weaknesses = ["ground", "psychic"]
            return weaknesses
        } else if defenseType == "ground" {
            let weaknesses = ["water", "grass", "ice"]
            return weaknesses
        } else if defenseType == "flying" {
            let weaknesses = ["electric", "ice", "rock"]
            return weaknesses
        } else if defenseType == "psychic" {
            let weaknesses = ["bug", "ghost", "dark"]
            return weaknesses
        } else if defenseType == "bug" {
            let weaknesses = ["fire", "flying", "rock"]
            return weaknesses
        } else if defenseType == "rock" {
            let weaknesses = ["fire", "ice", "poison", "flying", "bug"]
            return weaknesses
        } else if defenseType == "ghost" {
            let weaknesses = ["ghost", "dark"]
            return weaknesses
        } else if defenseType == "dragon" {
            let weaknesses = ["ice", "dragon", "fairy"]
            return weaknesses
        } else if defenseType == "dark" {
            let weaknesses = ["fighting", "bug", "fairy"]
            return weaknesses
        } else if defenseType == "steel" {
            let weaknesses = ["fire", "fighting", "ground"]
            return weaknesses
        } else if defenseType == "fairy" {
            let weaknesses = ["posion", "steel"]
            return weaknesses
        }
        return [""]
    }
}
