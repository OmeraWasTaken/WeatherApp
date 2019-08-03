//
//  WeatherDetailsCellInterface.swift
//  WeatherApp
//
//  Created by Quentin Richard on 03/08/2019.
//  Copyright © 2019 QuentinRichard. All rights reserved.
//

import Foundation

protocol WeatherDetailsCellInterface {
    var hours: String { get }
    var temperature: String { get }
    var humidity: String { get }
}
