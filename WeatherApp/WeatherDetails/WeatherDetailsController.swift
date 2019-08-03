//
//  WeatherDetailsController.swift
//  WetherApp
//
//  Created by Quentin Richard on 02/08/2019.
//  Copyright © 2019 QuentinRichard. All rights reserved.
//

import UIKit

final class WeatherDetailsController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    let viewModel: WeatherDetailsInterface

    init(with viewModel: WeatherDetailsInterface) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: WeatherDetailsController.bundle)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
}

private extension WeatherDetailsController {
    // *****************************************************************************************************************
    // MARK: - SetupView
    func setupTableView() {
        tableView.register(UINib(nibName: WeatherDetailsCell.nameOfClass, bundle: nil),
                           forCellReuseIdentifier: WeatherDetailsCell.nameOfClass)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension WeatherDetailsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.forecast.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherDetailsCell.nameOfClass,
                                                       for: indexPath) as? WeatherDetailsCell else {
                                                        return UITableViewCell()
        }
        let forecast = viewModel.forecast[indexPath.row]
        let viewModel = WeatherDetailsCellViewModel(hours: forecast.date,
                                                    temperature: forecast.weather.temperature,
                                                    humidity: String(forecast.weather.humidity))
        cell.setup(with: viewModel)
        return cell
    }

}

