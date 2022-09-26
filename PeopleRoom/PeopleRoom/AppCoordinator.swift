//
//  AppCoordinator.swift
//  HomePageFeedApp
//
//  Created by Przemek on 17/09/2022.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    func start()
}

class AppCoordinator: Coordinator {
    private weak var window: UIWindow?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let peopleFeedViewController = PeopleFeedViewController()
        peopleFeedViewController.viewModel = PeopleFeedViewModel(networkManager: NetworkManager())
        
        window?.rootViewController = peopleFeedViewController
        window?.makeKeyAndVisible()
    }
}
