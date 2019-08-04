//
//  WeatherInfomationTest.swift
//  WeatherAppTests
//
//  Created by Quentin Richard on 04/08/2019.
//  Copyright © 2019 QuentinRichard. All rights reserved.
//

import XCTest
@testable import WeatherApp

final class WeatherInfomationTest: XCTestCase {
    private let forecast = Data("""
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
""".utf8)

    func testDecoding_WhenWeatherInfomation_Equal() throws {
        // GIVEN
        // WHEN
        let weatherInformation = WeatherInformation(temperature: 291, humidity: Float(76.3))
        // THEN
        XCTAssertEqual(weatherInformation, try JSONDecoder().decode(WeatherInformation.self, from: forecast))
    }

    func testDecoding_WhenWeatherInfomation_NotEqual() throws {
        // GIVEN
        // WHEN
        let weatherInformation = WeatherInformation(temperature: 293, humidity: Float(76.3))
        // THEN
        XCTAssertNotEqual(weatherInformation, try JSONDecoder().decode(WeatherInformation.self, from: forecast))
    }
}
