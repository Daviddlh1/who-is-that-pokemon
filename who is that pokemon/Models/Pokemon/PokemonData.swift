//
//  PokemonData.swift
//  who is that pokemon
//
//  Created by David De la Hoz on 23/06/24.
//

import Foundation

struct PokemonData: Codable {
    let results: [Result]?
}

struct Result: Codable {
    let name: String?
    let url: String?
}
