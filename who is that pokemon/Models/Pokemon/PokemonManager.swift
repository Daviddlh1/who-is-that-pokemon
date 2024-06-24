//
//  PokemonManager.swift
//  who is that pokemon
//
//  Created by David De la Hoz on 23/06/24.
//

import Foundation

protocol PokemonManagerDelegate {
    func didUpdatePokemon(pokemons: [PokemonModel])
    func didFailWithError(error: Error)
}

struct PokemonManager {
    let pokemonURL = "https://pokeapi.co/api/v2/pokemon?limit=898"
    var delegate: PokemonManagerDelegate?
    
    func fetchPokemonAPI() {
        performRequest(with: pokemonURL)
    }
    
    // How can i perform a get requets:
    // 1. Create/ get URL
    // 2. Create the URLSession
    // 3. Give the session a task
    // 4. Start the task
    private func performRequest(with urlString: String) {
        // 1. Create/ get URL
        if let url = URL(string: pokemonURL) {
            // 2. Create the URLSession
            let session = URLSession(configuration: .default)
            // 3. Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                   return
                }
                if let safeData = data {
                    if let pokemons = self.parseJSON(pokemonData: safeData){
                        self.delegate?.didUpdatePokemon(pokemons: pokemons)
                    }
                }
            }
            // 4. Start the task
            task.resume()
            
        }
    }
    
    private func parseJSON(pokemonData: Data) -> [PokemonModel]? {
        let decoder = JSONDecoder()
        do{
            let decodeData = try decoder.decode(PokemonData.self, from: pokemonData)
            let pokemons = decodeData.results?.map {
                PokemonModel(name: $0.name ?? "", imageUrl: $0.url ?? "")
            }
            return pokemons
        } catch {
           return nil
        }
    }
}
