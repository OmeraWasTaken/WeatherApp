//
//  WeatherAppUITests.swift
//  WetherAppUITests
//
//  Created by Quentin Richard on 02/08/2019.
//  Copyright © 2019 QuentinRichard. All rights reserved.
//

import XCTest

class WeatherAppUITests: XCTestCase {
    var app: XCUIApplication!
    override func setUp() {
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCellSelection() {
        let app = XCUIApplication()
        app.tables.cells.element(matching: .cell, identifier: "Cell1").tap()
        app.navigationBars["WeatherApp.WeatherDetails"].buttons["Back"].tap()
    }
}
