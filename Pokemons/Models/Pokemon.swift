//
//  Pokemon.swift
//  Pokemons
//
//  Created by Valeria on 1/11/23.
//

import Foundation

struct Pokemon: Codable {
    let abilities: [Ability]
    let base_experience: Int
    let forms: [Form]
    let game_indices: [GameIndex]
    let height: Int
    let held_items: [HeldItem]
    let id: Int
    let is_default: Bool
    let location_area_encounters: String
    let moves: [Move]
    let name: String
    let order: Int
    let past_abilities: [String]
    let past_types: [String]
    let species: Species
    let sprites: Sprites
    let stats: [Stat]
    let types: [Type]
    let weight: Int
}

struct Ability: Codable {
    let ability: AbilityDetails
    let is_hidden: Bool
    let slot: Int
}

struct AbilityDetails: Codable {
    let name: String
    let url: String
}

struct Form: Codable {
    let name: String
    let url: String
}

struct GameIndex: Codable {
    let game_index: Int
    let version: Version
}

struct Version: Codable {
    let name: String
    let url: String
}

struct HeldItem: Codable {
    let item: Item
    let version_details: [VersionDetail]
}

struct Item: Codable {
    let name: String
    let url: String
}

struct VersionDetail: Codable {
    let rarity: Int
    let version: Version
}

struct Move: Codable {
    let move: MoveDetails
    let version_group_details: [VersionGroupDetail]
}

struct MoveDetails: Codable {
    let name: String
    let url: String
}

struct VersionGroupDetail: Codable {
    let level_learned_at: Int
    let move_learn_method: MoveLearnMethod
    let version_group: Version
}

struct MoveLearnMethod: Codable {
    let name: String
    let url: String
}

struct Species: Codable {
    let name: String
    let url: String
}

struct Sprites: Codable {
    let back_default: String
    let back_female: String?
    let back_shiny: String
    let back_shiny_female: String?
    let front_default: String?
    let front_female: String?
    let front_shiny: String?
    let front_shiny_female: String?
    let other: Other
}

struct Other: Codable {
    let dream_world: [String: String?]
    let home: Home
    let official_artwork: OfficialArtwork
    
    private enum CodingKeys: String, CodingKey {
        case dream_world
        case home
        case official_artwork = "official-artwork"
    }
}

struct Home: Codable {
    let front_default: String?
    let front_female: String?
    let front_shiny: String?
    let front_shiny_female: String?
}

struct OfficialArtwork: Codable {
    let front_default: String?
    let front_shiny: String?
}

struct Versions: Codable {
    let generation_i: GenerationI
    let generation_ii: GenerationII
    let generation_iii: GenerationIII
    let generation_iv: GenerationIV
    let generation_v: GenerationV
    let generation_vi: GenerationVI
    let generation_vii: GenerationVII
    let generation_viii: GenerationVIII
    
    private enum CodingKeys: String, CodingKey {
        case generation_i = "generation-i"
        case generation_ii = "generation-ii"
        case generation_iii = "generation-iii"
        case generation_iv = "generation-iv"
        case generation_v = "generation-v"
        case generation_vi = "generation-vi"
        case generation_vii = "generation-vii"
        case generation_viii = "generation-viii"
    }
}

struct GenerationI: Codable {
    let red_blue: RedBlue
    let yellow: Yellow
    
    private enum CodingKeys: String, CodingKey {
        case red_blue = "red-blue"
        case yellow
    }
}

struct RedBlue: Codable {
    let back_default: String
    let back_gray: String
    let back_transparent: String
    let front_default: String?
    let front_gray: String
    let front_transparent: String
}

struct Yellow: Codable {
    let back_default: String
    let back_gray: String
    let back_transparent: String
    let front_default: String?
    let front_gray: String
    let front_transparent: String
}

struct GenerationII: Codable {
    let crystal: Crystal
    let gold: Gold
    let silver: Silver
}

struct Crystal: Codable {
    let back_default: String
    let back_shiny: String
    let back_shiny_transparent: String
    let back_transparent: String
    let front_default: String?
    let front_shiny: String?
    let front_shiny_transparent: String
    let front_transparent: String
}

struct Gold: Codable {
    let back_default: String
    let back_shiny: String
    let front_default: String?
    let front_shiny: String?
    let front_transparent: String
}

struct Silver: Codable {
    let back_default: String
    let back_shiny: String
    let front_default: String?
    let front_shiny: String?
    let front_transparent: String
}

struct GenerationIII: Codable {
    let emerald: Emerald
    let firered_leafgreen: FireredLeafgreen
    let ruby_sapphire: RubySapphire
    
    private enum CodingKeys: String, CodingKey {
        case emerald
        case firered_leafgreen = "firered-leafgreen"
        case ruby_sapphire = "ruby-sapphire"
    }
}

struct Emerald: Codable {
    let front_default: String?
    let front_shiny: String?
}

struct FireredLeafgreen: Codable {
    let back_default: String
    let back_shiny: String
    let front_default: String?
    let front_shiny: String?
}

struct RubySapphire: Codable {
    let back_default: String
    let back_shiny: String
    let front_default: String?
    let front_shiny: String?
}

struct GenerationIV: Codable {
    let diamond_pearl: DiamondPearl
    let heartgold_soulsilver: HeartgoldSoulsilver
    let platinum: Platinum
    
    private enum CodingKeys: String, CodingKey {
        case diamond_pearl = "diamond-pearl"
        case heartgold_soulsilver = "heartgold-soulsilver"
        case platinum
    }
}

struct DiamondPearl: Codable {
    let back_default: String
    let back_female: String
    let back_shiny: String
    let back_shiny_female: String
    let front_default: String?
    let front_female: String?
    let front_shiny: String?
    let front_shiny_female: String?
}

struct HeartgoldSoulsilver: Codable {
    let back_default: String
    let back_female: String
    let back_shiny: String
    let back_shiny_female: String
    let front_default: String?
    let front_female: String?
    let front_shiny: String?
    let front_shiny_female: String?
}

struct Platinum: Codable {
    let back_default: String
    let back_female: String
    let back_shiny: String
    let back_shiny_female: String
    let front_default: String?
    let front_female: String?
    let front_shiny: String?
    let front_shiny_female: String?
}

struct GenerationV: Codable {
    let black_white: BlackWhite
    
    private enum CodingKeys: String, CodingKey {
        case black_white = "black-white"
    }
}

struct BlackWhite: Codable {
    let animated: Animated
    let back_default: String
    let back_female: String?
    let back_shiny: String
    let back_shiny_female: String?
    let front_default: String?
    let front_female: String?
    let front_shiny: String?
    let front_shiny_female: String?
}

struct Animated: Codable {
    let back_default: String
    let back_female: String?
    let back_shiny: String
    let back_shiny_female: String?
    let front_default: String?
    let front_female: String?
    let front_shiny: String?
    let front_shiny_female: String?
}

struct GenerationVI: Codable {
    let front_default: String?
    let front_shiny: String?
}

struct GenerationVII: Codable {
    let icons: Icons
    let ultra_sun_ultra_moon: UltraSunUltraMoon
}

struct Icons: Codable {
    let front_default: String?
    let front_female: String
}

struct UltraSunUltraMoon: Codable {
    let back_default: String
    let back_female: String
    let back_shiny: String
    let back_shiny_female: String
    let front_default: String?
    let front_female: String
    let front_shiny: String?
    let front_shiny_female: String?
}

struct GenerationVIII: Codable {
    let icons: Icons
}

struct Stat: Codable {
    let base_stat: Int
    let effort: Int
    let stat: StatDetails
}

struct StatDetails: Codable {
    let name: String
    let url: String
}

struct Type: Codable {
    let slot: Int
    let type: TypeDetails
}

struct TypeDetails: Codable {
    let name: String
    let url: String
}
