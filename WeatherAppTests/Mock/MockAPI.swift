//
//  MockAPI.swift
//  WeatherAppTests
//
//  Created by Quentin Richard on 04/08/2019.
//  Copyright © 2019 QuentinRichard. All rights reserved.
//

import Foundation
@testable import WeatherApp

final class MockApiNotEmpty: APIInterface {
    func getWeather(lat: Double, long: Double, handler: @escaping (Result<Forecast?, Error>) -> Void) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: "2019-08-04 05:00:00")!
        let weatherInformation = WeatherInformation(temperature: 291, humidity: Float(76.3))
        let forecastTest = [date: weatherInformation]
        handler(.success(Forecast(forecast: forecastTest)))
    }
}

final class MockApiEmpty: APIInterface {
    func getWeather(lat: Double, long: Double, handler: @escaping (Result<Forecast?, Error>) -> Void) {
        let forecastTest: [Date: WeatherInformation] = [:]
        handler(.success(Forecast(forecast: forecastTest)))
    }
}
