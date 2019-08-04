//
//  ForecastTest.swift
//  WeatherAppTests
//
//  Created by Quentin Richard on 04/08/2019.
//  Copyright © 2019 QuentinRichard. All rights reserved.
//

import XCTest
@testable import WeatherApp

final class ForecastTest: XCTestCase {
    private let forecast = Data("""
{
"2019-08-04 05:00:00":
    {
        "temperature":
        {
            "2m":290.6,
            "sol":291,
            "500hPa":-0.1,
            "850hPa":-0.1
        },
        "humidite":
        {
            "2m":76.3
        }
    }
}
""".utf8)

    func testDecoding_WhenForecast_Equal() throws {
        // GIVEN
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: "2019-08-04 05:00:00")!
        let weatherInformation = WeatherInformation(temperature: 291, humidity: Float(76.3))
        // WHEN
        let forecastTest = [date: weatherInformation]
        // THEN
        XCTAssertEqual(Forecast(forecast: forecastTest), try JSONDecoder().decode(Forecast.self, from: forecast))
    }

    func testDecoding_WhenForecast_NotEqual() throws {
        // GIVEN
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: "2019-08-04 05:00:00")!
        let weatherInformation = WeatherInformation(temperature: 293, humidity: Float(76.3))
        // WHEN
        let forecastTest = [date: weatherInformation]
        // THEN
        XCTAssertNotEqual(Forecast(forecast: forecastTest), try JSONDecoder().decode(Forecast.self, from: forecast))
    }
}

