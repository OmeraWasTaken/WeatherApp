//
//  Forecast.swift
//  WeatherApp
//
//  Created by Quentin Richard on 03/08/2019.
//  Copyright © 2019 QuentinRichard. All rights reserved.
//

import Foundation

struct Forecast: Equatable {
    let forecast: [Date: WeatherInformation]
    
    static func == (lhs: Forecast, rhs: Forecast) -> Bool {
        return lhs.forecast == rhs.forecast
    }
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
