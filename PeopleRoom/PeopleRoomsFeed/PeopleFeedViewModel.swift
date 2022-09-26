//
//  PeopleFeedViewModel.swift
//  PeopleRoom
//
//  Created by Andrew Thwaites on 21/09/2022.
//

import Foundation

final class PeopleFeedViewModel {
    var peopleList: [PeopleModel] = []
    var peopleRecordCount: Int { return peopleList.count}
    private let networkManager: NetworkManagerActions
    
    init(networkManager: NetworkManagerActions) {
        self.networkManager = networkManager
    }
 
    func getNewsAsync() async {
        do {
            let people = try await networkManager.getNewsAsync()
            peopleList = people
        } catch {
            print(error)
        }
    }

    func getPeopleModel(index: Int) -> PeopleModel {
        return peopleList[index]
    }
}
