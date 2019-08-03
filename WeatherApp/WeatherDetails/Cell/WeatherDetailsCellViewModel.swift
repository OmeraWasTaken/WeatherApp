//
//  WeatherDetailsCellViewModel.swift
//  WeatherApp
//
//  Created by Quentin Richard on 03/08/2019.
//  Copyright © 2019 QuentinRichard. All rights reserved.
//

import Foundation

final class WeatherDetailsCellViewModel: WeatherDetailsCellInterface {
    // *****************************************************************************************************************
    // MARK: - Variable
    var hours = ""
    var temperature = ""
    var humidity = ""
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter
    }()


    init(hours: Date, temperature: Int, humidity: String) {
        setupHours(with: hours)
        setupTemperature(with: temperature)
        setupHumidity(with: humidity)
    }
}

private extension WeatherDetailsCellViewModel {
    func setupHours(with hours: Date) {
        self.hours = dateFormatter.string(from: hours)
    }

    func setupTemperature(with temperature: Int) {
        self.temperature = String(temperature - 273) + "°C"
    }

    func setupHumidity(with humidity: String) {
        self.humidity = humidity + "%"
    }
}
