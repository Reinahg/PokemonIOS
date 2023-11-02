//
//  PokemonsViewModelTests.swift
//  PokemonsTests
//
//  Created by Valeria on 1/11/23.
//

import Foundation
import XCTest
@testable import Pokemons

class PokemonsViewModelTests: XCTestCase {
    
    func testFetchPokemonDataSuccess() {
        let mockAPIService = MockAPIService()
        mockAPIService.shouldSucceed = true
        let viewModel = PokemonsViewModel(apiService: mockAPIService)
        
        let expectation = XCTestExpectation(description: "Fetch Pokémon data successful")
        
        viewModel.bindPokemonViewModelToController = {
            XCTAssertNotNil(viewModel.pokemonData, "Pokemon should not be nil")
            expectation.fulfill()
        }
        
        viewModel.callFuncToGetEmpData(idPokemon: 25)
        
        wait(for: [expectation], timeout: 8)
    }

    func testFetchPokemonDataFailure() {
        let mockAPIService = MockAPIService()
        mockAPIService.shouldSucceed = false
        let viewModel = PokemonsViewModel(apiService: mockAPIService)
        
        let expectation = XCTestExpectation(description: "Fetch Pokémon data failure")
        
        viewModel.showErrorToController = {
            XCTAssertNotNil(viewModel.errorData, "Error should not be nil")
            expectation.fulfill()
        }
        
        viewModel.callFuncToGetEmpData(idPokemon: 25)
        
        wait(for: [expectation], timeout: 8)
    }
}
