//
//  APIService.swift
//  Pokemons
//
//  Created by Valeria on 1/11/23.
//

import Foundation
import Alamofire

class APIService : NSObject {
    func fetchPokemonData(idPokemon: Int, completion: @escaping (Pokemon?, Error?) -> Void) {
        let sourcesURL = URL(string: Constants.API.apiURL+"\(idPokemon)")!
        AF.request(sourcesURL).responseDecodable(of: Pokemon.self){ response in
            switch response.result {
            case .success(let pokemon):
                completion(pokemon,nil)
            case .failure(let error):
                completion(nil,error)
            }
        }
    }
}
