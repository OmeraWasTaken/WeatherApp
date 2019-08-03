//
//  WeatherListCell.swift
//  WetherApp
//
//  Created by Quentin Richard on 02/08/2019.
//  Copyright © 2019 QuentinRichard. All rights reserved.
//

import UIKit

final class WeatherListCell: UITableViewCell {
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var humidityLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!

    var viewModel: WeatherListCellInterface?

    func setup(with viewModel: WeatherListCellInterface) {
        self.viewModel = viewModel
        setupView()
    }
}

private extension WeatherListCell {
    func setupView() {
        setupCityLabel()
        setupTemperatureLabel()
        setupHumidityLabel()
        setupDateLabel()
    }

    func setupCityLabel() {
        cityLabel.text = viewModel?.city
    }

    func setupTemperatureLabel() {
        temperatureLabel.text = viewModel?.temperature
    }

    func setupHumidityLabel() {
        humidityLabel.text = viewModel?.humidity
    }

    func setupDateLabel() {
        dateLabel.text = viewModel?.date
    }
}
