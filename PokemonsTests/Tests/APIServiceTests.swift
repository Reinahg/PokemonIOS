//
//  APIServiceTests.swift
//  PokemonsTests
//
//  Created by Valeria on 1/11/23.
//

import Foundation
import XCTest
@testable import Pokemons

class APIServiceTests: XCTestCase {

    func testFetchPokemonDataSuccess() {
        let apiService = APIService()
        
        let expectation = XCTestExpectation(description: "Fetch Pokémon data successful")
        
        apiService.fetchPokemonData (idPokemon: 25){ (pokemon, error) in
            XCTAssertNil(error, "Error should be nil")
            XCTAssertNotNil(pokemon, "Pokemon should not be nil")
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 7)
    }
}
