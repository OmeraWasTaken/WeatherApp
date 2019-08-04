//
//  Forecast.swift
//  WeatherApp
//
//  Created by Quentin Richard on 03/08/2019.
//  Copyright © 2019 QuentinRichard. All rights reserved.
//

import Foundation

struct Forecast {
    let forecast: [Date: WeatherInformation]
}

extension Forecast: Decodable {
    init(from decoder: Decoder) throws {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let values = try decoder.container(keyedBy: CodingByKey.self)
        var forecast = [Date: WeatherInformation]()
        for key in values.allKeys {
            if let date = dateFormatter.date(from: key.stringValue) {
                forecast[date] = try values.decode(WeatherInformation.self, forKey: key)
            }
        }
        self.forecast = forecast
    }
}

struct CodingByKey: CodingKey {
    var stringValue: String
    var intValue: Int?

    init?(stringValue: String) {
        self.stringValue = stringValue
    }

    init?(intValue: Int) {
        self.intValue = intValue
        self.stringValue = String(intValue)
    }

    static func makeKey(name: String) -> CodingByKey {
        return CodingByKey(stringValue: name)!
    }
}
