//
//  ImageData.swift
//  who is that pokemon
//
//  Created by David De la Hoz on 23/06/24.
//

import Foundation

struct ImageData: Codable {
    let sprites: PokemonSprites?
}

class PokemonSprites: Codable {
    let other: Other?
    
    init(other: Other?) {
        self.other = other
    }
}

struct Other: Codable {
    let officialArtWork: PokemonOfficialArtWork?
    
    enum CodingKeys: String, CodingKey {
        case officialArtWork = "official-artwork"
    }
}

struct PokemonOfficialArtWork: Codable {
    let frontDefault: String?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
