//
//  MockApiService.swift
//  PokemonsTests
//
//  Created by Valeria on 1/11/23.
//

import Foundation
import XCTest
@testable import Pokemons

class MockAPIService: APIService {
    var shouldSucceed: Bool = true

    override func fetchPokemonData(idPokemon:Int, completion: @escaping (Pokemon?, Error?) -> Void) {
        if shouldSucceed {
            let mockPokemon = Pokemon(
                abilities: [Ability(ability: AbilityDetails(name: "", url: ""), is_hidden: false, slot: 0)],
                base_experience: 0,
                forms: [Form(name: "", url: "")],
                game_indices: [GameIndex(game_index: 0, version: Version(name: "", url: ""))],
                height: 0,
                held_items: [HeldItem(item: Item(name: "", url: ""), version_details: [VersionDetail(rarity: 0, version: Version(name: "", url: ""))])],
                id: 0,
                is_default: true,
                location_area_encounters: "",
                moves: [Move(move: MoveDetails(name: "", url: ""), version_group_details: [VersionGroupDetail(level_learned_at: 0, move_learn_method: MoveLearnMethod(name: "0", url: ""), version_group: Version(name: "", url: ""))])],
                name: "",
                order: 0,
                past_abilities: [""],
                past_types: [""],
                species: Species(name: "", url: ""),
                sprites: Sprites(back_default: "", back_female: nil, back_shiny: "", back_shiny_female: "", front_default: "", front_female: "", front_shiny: "", front_shiny_female: "", other: Other(dream_world: ["":""], home: Home(front_default: nil, front_female: "", front_shiny: "", front_shiny_female: ""), official_artwork: OfficialArtwork(front_default: nil, front_shiny: nil))),
                stats: [Stat(base_stat: 0, effort: 0, stat: StatDetails(name: "", url: ""))],
                types: [Type(slot: 0, type: TypeDetails(name: "", url: ""))],
                weight: 0)
            completion(mockPokemon, nil)
        } else {
            let error = NSError(domain: "TestDomain", code: 500, userInfo: nil)
            completion(nil, error)
        }
    }
}
