//
//  WeatherListInterface.swift
//  WetherApp
//
//  Created by Quentin Richard on 02/08/2019.
//  Copyright © 2019 QuentinRichard. All rights reserved.
//

import CoreLocation
import Foundation
import MapKit

protocol WeatherListInterface {
    typealias WeatherByDate = (date: Date, weather: WeatherInformation)

    // *****************************************************************************************************************
    // MARK: - Actions
    var refreshTableViewAction: (() -> Void) { get set }
    var cellDidTap: (([WeatherByDate]) -> Void) { get set }

    // *****************************************************************************************************************
    // MARK: - Variables
    var dates: [Date] { get }
    var city: String { get }

    // *****************************************************************************************************************
    // MARK: - Func
    func getForecastByDay(date: Date) -> [WeatherByDate]
    func getWeather(lat: Double, long: Double)
    func getCity(location: CLLocation)
}
