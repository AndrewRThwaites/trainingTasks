//
//  PeopleRoomsFeedModel.swift
//  PeopleRoom App
//
//  Created by Andrew Thwaites on 21/09/2022.
//

import Foundation

struct PeopleModel: Decodable {
    let createdAt: String?
    let firstName: String?
    let avatar: String?
    let lastName: String?
    let email: String?
    let jobtitle: String?
    let favoriteColor: String?
    let id: String?
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt =  try values.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        self.firstName = try values.decodeIfPresent(String.self, forKey: .firstName) ?? ""
        self.avatar = try values.decodeIfPresent(String.self, forKey: .avatar) ?? ""
        self.lastName = try values.decodeIfPresent(String.self, forKey: .lastName)  ?? ""
        self.jobtitle = try values.decodeIfPresent(String.self, forKey: .jobtitle)  ?? ""
        self.favoriteColor = try values.decodeIfPresent(String.self, forKey: .favoriteColor)  ?? ""
        self.id = try values.decodeIfPresent(String.self, forKey: .id)  ?? ""
        self.email = try values.decodeIfPresent(String.self, forKey: .email) ?? ""
        
        print("\(self.firstName!)  \(self.lastName!)")
    }

    enum CodingKeys: String, CodingKey {
        case createdAt
        case firstName
        case avatar
        case lastName
        case email
        case jobtitle
        case favoriteColor
        case id
    }
}
