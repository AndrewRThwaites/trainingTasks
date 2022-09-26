//
//  PeopleFeedViewModel.swift
//  PeopleRoom
//
//  Created by Andrew Thwaites on 21/09/2022.
//

import Foundation

final class RoomFeedViewModel {
    var roomList: [PeopleModel] = []
    var roomRecordCount: Int { return roomList.count}
    private let networkManager: NetworkManagerActions
    
    init(networkManager: NetworkManagerActions) {
        self.networkManager = networkManager
    }
 
    func getNewsAsync() async {
        do {
            let room = try await networkManager.getNewsAsync()
            roomList = room
        } catch {
            print(error)
        }
    }

    func getPeopleModel(index: Int) -> PeopleModel {
        return roomList[index]
    }
}
