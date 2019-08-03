//
//  WeatherListCellViewModel.swift
//  WetherApp
//
//  Created by Quentin Richard on 02/08/2019.
//  Copyright © 2019 QuentinRichard. All rights reserved.
//

import Foundation

final class WeatherListCellViewModel: WeatherListCellInterface {
    let city: String
    var date = ""
    var temperature = ""
    var humidity = ""
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE d MMMM"
        return dateFormatter
    }()


    init(date: Date, city: String, temperature: Int, humidity: Float) {
        self.city = city

        manageDate(with: date)
        manageTemperature(with: temperature)
        manageHumnidty(with: String(humidity))
    }

    func manageDate(with date: Date) {
        self.date = dateFormatter.string(from: date)
    }

    func manageTemperature(with temperature: Int) {
        self.temperature = String(temperature - 273) + "°C"
    }

    func manageHumnidty(with humidity: String) {
        self.humidity = humidity + "%"
    }
}
