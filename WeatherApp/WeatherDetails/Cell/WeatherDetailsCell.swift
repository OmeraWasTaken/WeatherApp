//
//  WeatherDetailsCell.swift
//  WeatherApp
//
//  Created by Quentin Richard on 03/08/2019.
//  Copyright © 2019 QuentinRichard. All rights reserved.
//

import UIKit

final class WeatherDetailsCell: UITableViewCell {
    // *****************************************************************************************************************
    // MARK: - IBOutlet
    @IBOutlet private weak var hoursLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var humidityLabel: UILabel!

    // *****************************************************************************************************************
    // MARK: - Variable
    var viewModel: WeatherDetailsCellInterface?

    func setup(with viewModel: WeatherDetailsCellInterface) {
        self.viewModel = viewModel
        setupView()
    }
}

extension WeatherDetailsCell {
    // *****************************************************************************************************************
    // MARK: - SetupView
    func setupView() {
        setupHoursLabel()
        setupTemperatureLabel()
        setupHumidityLabel()
    }

    func setupHoursLabel() {
        hoursLabel.text = viewModel?.hours
    }

    func setupTemperatureLabel() {
        temperatureLabel.text = viewModel?.temperature
    }

    func setupHumidityLabel() {
        humidityLabel.text = viewModel?.humidity
    }
}
