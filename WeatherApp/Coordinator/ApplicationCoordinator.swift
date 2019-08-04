//
//  ApplicationCoordinator.swift
//  WetherApp
//
//  Created by Quentin Richard on 02/08/2019.
//  Copyright © 2019 QuentinRichard. All rights reserved.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    let window: UIWindow
    let rootViewController: UINavigationController
    let weatherListCoordinator: WeatherListCoordinator

    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
//        rootViewController.navigationBar.prefersLargeTitles = true
        weatherListCoordinator = WeatherListCoordinator(presenter: rootViewController)
        weatherListCoordinator.start()
    }

    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
