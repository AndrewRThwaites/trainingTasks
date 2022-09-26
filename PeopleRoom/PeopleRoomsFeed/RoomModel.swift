//
//  PeopleRoomsFeedModel.swift
//  PeopleRoom App
//
//  Created by Andrew Thwaites on 21/09/2022.
//

import Foundation

// createdAt":"2022-01-24T20:52:50.765Z","isOccupied":false,"maxOccupancy":53539,"id":"1"

struct RoomModel: Decodable {
    let createdAt: String?
    let isOccupied: String?
    let maxOccupancy: String?
    let id: String?
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.createdAt =  try values.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        self.isOccupied = try values.decodeIfPresent(String.self, forKey: .isOccupied) ?? ""
        self.maxOccupancy = try values.decodeIfPresent(String.self, forKey: .maxOccupancy) ?? ""
        self.id = try values.decodeIfPresent(String.self, forKey: .id)  ?? ""
    }

    enum CodingKeys: String, CodingKey {
        case createdAt
        case isOccupied
        case maxOccupancy
        case id
    }
}
