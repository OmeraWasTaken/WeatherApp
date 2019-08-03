//
//  WeatherDetailsInterface.swift
//  WetherApp
//
//  Created by Quentin Richard on 02/08/2019.
//  Copyright © 2019 QuentinRichard. All rights reserved.
//

import Foundation

protocol WeatherDetailsInterface {
    typealias WeatherByDate = (date: Date, weather: WeatherInformation)

    // *****************************************************************************************************************
    // MARK: - Variable
    var forecast: [WeatherByDate] { get }
}
