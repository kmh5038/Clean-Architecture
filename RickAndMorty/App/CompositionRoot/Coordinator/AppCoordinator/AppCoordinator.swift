//
//  AppCoordinator.swift
//  RickAndMorty
//
//  Created by 김명현 on 5/21/24.
//

import UIKit

final class AppCoordinator: Coordinator {
    var navigation: UINavigationController
    private let appFactory: AppFactory
    
    init(navigation: UINavigationController, appFactory: AppFactory, window: UIWindow?) {
        self.navigation = navigation
        self.appFactory = appFactory
        configwindow(window: window)
    }
    
    func start() {
        let coordinator = appFactory.makeHomeCoordinator(navigation: navigation)
        coordinator.start()
    }
    
    private func configwindow(window: UIWindow?) {
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
}
