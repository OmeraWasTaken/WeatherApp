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

    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true

        // Remove it if working
        let emptyViewController = UIViewController()
        emptyViewController.view.backgroundColor = .cyan
        rootViewController.pushViewController(emptyViewController, animated: false)
    }

    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
