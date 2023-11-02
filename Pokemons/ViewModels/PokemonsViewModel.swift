//
//  PokemonsViewModel.swift
//  Pokemons
//
//  Created by Valeria on 1/11/23.
//

import UIKit

class PokemonsViewModel: NSObject {
    private var apiService : APIService!
    private(set) var errorData : Error! {
        didSet {
            self.showErrorToController()
        }
    }
    private(set) var pokemonData : Pokemon! {
        didSet {
            self.bindPokemonViewModelToController()
        }
    }
    
    var bindPokemonViewModelToController : (() -> ()) = {}
    var showErrorToController : (() -> ()) = {}
    
    init(apiService: APIService? = nil) {
        super.init()
        if let apiService = apiService {
            self.apiService = apiService
        } else {
            self.apiService = APIService()
        }
    }
    
    func callFuncToGetEmpData(idPokemon: Int) {
        self.apiService.fetchPokemonData(idPokemon: idPokemon){ (pokemon, error) in
            if let pokemonData = pokemon {
                self.pokemonData = pokemonData
            } else if let errorData = error {
                self.errorData = errorData
            }
        }
    }
}
