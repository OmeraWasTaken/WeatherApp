//
//  WeatherInformation.swift
//  WeatherApp
//
//  Created by Quentin Richard on 03/08/2019.
//  Copyright © 2019 QuentinRichard. All rights reserved.
//

import Foundation

struct WeatherInformation: Decodable {
    let temperature: Int
    let humidity: Float

    enum CodingKeys: String, CodingKey {
        case temperature = "temperature"
        case humidity = "humidite"
    }

    enum TemperatureKeys: String, CodingKey {
        case ground = "sol"
    }

    enum HumidityKeys: String, CodingKey {
        case twoMeters = "2m"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let temperatureValues = try values.nestedContainer(keyedBy: TemperatureKeys.self, forKey: .temperature)
        let temperature = try temperatureValues.decode(Float.self, forKey: .ground)
        self.temperature = Int(temperature)
        let humidityValues = try values.nestedContainer(keyedBy: HumidityKeys.self, forKey: .humidity)
        self.humidity = try humidityValues.decode(Float.self, forKey: .twoMeters)
    }
}
