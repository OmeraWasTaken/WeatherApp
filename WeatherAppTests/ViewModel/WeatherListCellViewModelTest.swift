//
//  WeatherListCellViewModelTest.swift
//  WeatherAppTests
//
//  Created by Quentin Richard on 04/08/2019.
//  Copyright © 2019 QuentinRichard. All rights reserved.
//

import XCTest
@testable import WeatherApp

final class WeatherListCellViewModelTest: XCTestCase {
    func testManageTemperature_WhenTemperature_Given() {
        // GIVEN
        let date = Date()
        // WHEN
        let sut = WeatherListCellViewModel(date: date,
                                           city: "Paris",
                                           temperature: 290,
                                           humidity: 0)
        // THEN
        XCTAssertEqual(sut.temperature, "17°C")
    }

    func testmanageHumnidty_WhenDate_Given() {
        // GIVEN
        let date = Date()
        // WHEN
        let sut = WeatherListCellViewModel(date: date,
                                           city: "Paris",
                                           temperature: 0,
                                           humidity: 25)
        // THEN
        XCTAssertEqual(sut.humidity, "25.0%")
    }
}
