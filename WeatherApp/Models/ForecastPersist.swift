//
//  ForecastPersist.swift
//  WeatherApp
//
//  Created by Quentin Richard on 04/08/2019.
//  Copyright © 2019 QuentinRichard. All rights reserved.
//

import CoreData
import UIKit

final class ForecastPersisted {
    private let entityName = "ForecastData"

    func save(forecast: Forecast) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        guard let storedForecastEntity = NSEntityDescription.entity(forEntityName: entityName,
                                                                    in: managedContext) else { return }

        for datedUnit in forecast.forecast {
            let forecastData = NSManagedObject(entity: storedForecastEntity, insertInto: managedContext)
            forecastData.setValue(datedUnit.value.temperature, forKeyPath: "temperature")
            forecastData.setValue(datedUnit.value.humidity, forKeyPath: "humidity")
            forecastData.setValue(datedUnit.key, forKey: "date")

        }
        do {
            try managedContext.save()
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }

    func clean() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try managedContext.execute(deleteRequest)
        } catch let error {
            print("Could not remove. \(error.localizedDescription)")
        }
    }

    func getForecastData() -> Forecast? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        let managedContext = appDelegate.persistentContainer.viewContext
        let forecastData = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        var forecast: [Date: WeatherInformation] = [:]

        do {
            let forecastContext = try managedContext.fetch(forecastData)
            let weatherInfo = forecastContext.compactMap({ $0 as? ForecastData })

            for weather in weatherInfo.map({ (date: $0.date, info: WeatherInformation(forecastData: $0) ) }) {
                guard let date = weather.date else { continue }
                forecast[date] = weather.info
            }
        } catch let error {
            print("Could not fetch. \(error.localizedDescription)")
            return nil
        }
        return Forecast(forecast: forecast)
    }
}
