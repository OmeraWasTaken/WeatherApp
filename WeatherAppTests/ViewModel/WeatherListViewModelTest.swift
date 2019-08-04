//
//  WeatherListViewModelTest.swift
//  WeatherAppTests
//
//  Created by Quentin Richard on 04/08/2019.
//  Copyright © 2019 QuentinRichard. All rights reserved.
//

import XCTest
@testable import WeatherApp

final class WeatherListViewModelTest: XCTestCase {
    func testDistincDate_WhenForecast_NotEmpty() {
        // GIVEN
        let api = MockApiNotEmpty()
        let sut = WeatherListViewModel(with: api)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: "2019-08-04 05:00:00")!
        // WHEN
        sut.distinctDays()
        // THEN
        XCTAssertEqual(sut.dates, [date])
    }

    func testDistincDate_WhenForecast_NotGiven() {
        // GIVEN
        let api = MockApiEmpty()
        let sut = WeatherListViewModel(with: api)
        // WHEN
        sut.distinctDays()
        // THEN
        XCTAssertEqual(sut.dates, [])
    }

    func testForecastByDay_WhenForecast_Given() {
        // GIVEN
        let api = MockApiNotEmpty()
        let sut = WeatherListViewModel(with: api)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: "2019-08-04 05:00:00")!
        // WHEN
        let valueTest = sut.getForecastByDay(date: date)
        // THEN
        XCTAssertEqual(valueTest.first?.weather.temperature, 291)
    }

    func testForecastByDay_WhenForecast_NotGiven() {
        // GIVEN
        let api = MockApiEmpty()
        let sut = WeatherListViewModel(with: api)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: "2019-08-04 05:00:00")!
        // WHEN
        let valueTest = sut.getForecastByDay(date: date)
        // THEN
        XCTAssertEqual(valueTest.first?.weather.temperature, nil)
    }
}
