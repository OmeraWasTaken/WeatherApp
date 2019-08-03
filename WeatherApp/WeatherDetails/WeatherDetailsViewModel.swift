//
//  WeatherDetailsViewModel.swift
//  WetherApp
//
//  Created by Quentin Richard on 02/08/2019.
//  Copyright © 2019 QuentinRichard. All rights reserved.
//

import Foundation

final class WeatherDetailsViewModel: WeatherDetailsInterface {
    let forecast: [WeatherByDate]
    
    init(with forecast: [WeatherByDate]) {
        self.forecast = forecast
    }
}
