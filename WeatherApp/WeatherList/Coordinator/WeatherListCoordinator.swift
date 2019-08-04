//
//  WeatherListCoordinator.swift
//  WetherApp
//
//  Created by Quentin Richard on 02/08/2019.
//  Copyright © 2019 QuentinRichard. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class WeatherListCoordinator: Coordinator {
    private let presenter: UINavigationController
    private var weatherListController: WeatherListTableView?
    private let api = API()

    init(presenter: UINavigationController) {
        self.presenter = presenter
    }

    func start() {
        let viewModel = WeatherListViewModel(with: api)
        let controller = WeatherListTableView(with: viewModel)
        presenter.pushViewController(controller, animated: true)
        viewModel.cellDidTap = { [weak self] forecast in
            let viewModel = WeatherDetailsViewModel(with: forecast)
            let controller = WeatherDetailsController(with: viewModel)
            self?.presenter.pushViewController(controller, animated: true)
        }
        self.weatherListController = controller
    }}
