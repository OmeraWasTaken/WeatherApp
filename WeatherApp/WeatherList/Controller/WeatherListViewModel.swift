//
//  WeatherListViewModel.swift
//  WetherApp
//
//  Created by Quentin Richard on 02/08/2019.
//  Copyright © 2019 QuentinRichard. All rights reserved.
//

import CoreLocation
import Foundation
import MapKit

final class WeatherListViewModel: WeatherListInterface {
    // *****************************************************************************************************************
    // MARK: - Variables
    private var forecast: Forecast?
    private let forecastPersisted = ForecastPersisted()
    private let api: APIInterface
    var city = "Paris"
    var dates = [Date]()
    
    // *****************************************************************************************************************
    // MARK: - Actions
    var refreshTableViewAction: (() -> Void) = {}
    var cellDidTap: (([WeatherByDate]) -> Void) = {_ in }
    var refreshData: ((_ lat: Double, _ long: Double) -> Void) = {_,_ in }
    var onError: (() -> Void) = {}

    init(with api: APIInterface) {
        self.api = api
        getWeather(lat: 48.85341, long: 2.3488)
        bindRefreshDataAction()
    }

    func getWeather(lat: Double, long: Double) {
        api.getWeather(lat: lat, long: long) { [weak self] result in
            switch result {
            case .success(let data):
                if let forecast = data {
                    DispatchQueue.main.async {
                        self?.forecastPersisted.clean()
                        self?.forecastPersisted.save(forecast: forecast)
                    }
                    self?.forecast = forecast
                    self?.distinctDays()
                } else {
                    self?.getPersistedData()
                }
            case .failure:
                self?.getPersistedData()
                self?.onError()
            }
        }
    }

    func getCity(location: CLLocation) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location, completionHandler: { placemarker, error  in
            if let city = placemarker?[0].locality {
                self.city = city
            }
        })
    }

    func getForecastByDay(date: Date) -> [WeatherByDate] {
        if let forecast = forecast {
            return forecast.forecast.filter({ Calendar.current.isDate($0.key, inSameDayAs: date) }).map({ (date: $0, weather: $1) }).sorted(by: { $0.date < $1.date })
        } else {
            return []
        }
    }

    func distinctDays() {
        var distinctDayDates = [Date]()
        let dates = forecast?.forecast.keys.sorted() ?? []
        guard var currentDayDate = dates.first else {
            return
        }
        distinctDayDates.append(currentDayDate)
        for date in dates.dropFirst() where !Calendar.current.isDate(date, inSameDayAs: currentDayDate) {
            currentDayDate = date
            distinctDayDates.append(date)
        }
        self.dates = distinctDayDates
        refreshTableViewAction()
    }
}

private extension WeatherListViewModel {
    func bindRefreshDataAction() {
        refreshData = { [weak self] lat, long in
            self?.getWeather(lat: lat, long: long)
            self?.getCity(location: CLLocation(latitude: lat, longitude: long))
        }
    }

    func getPersistedData() {
        if let forecast = self.forecastPersisted.getForecastData() {
            self.forecast = forecast
            self.distinctDays()
        }
    }
}
