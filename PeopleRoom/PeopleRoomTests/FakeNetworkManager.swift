//
//  NetworkManager.swift
//  PeopleRoom
//
//  Created by Andrew Thwaites on 21/09/2022.
//

import Foundation
import PeopleModel

let peopleURL: String = "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/people"

protocol NetworkManagerActions {
    func getNewsAsync()async throws -> [PeopleModel]
}

enum NetworkError: Error {
    case invalidURL
    case dataNotFound
    case parsingFailed
}

final class FakeNetworkManager: NetworkManagerActions {

    func getNewsAsync()async throws -> [PeopleModel] {
        guard let url = URL(string: peopleURL) else {
            throw NetworkError.invalidURL
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let peoples = try decoder.decode([PeopleModel].self, from: data)
            return peoples
        } catch {
            print(error)
            throw NetworkError.parsingFailed
        }
    }
    
}

