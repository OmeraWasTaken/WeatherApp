//
//  WetherListCellInterfae.swift
//  WetherApp
//
//  Created by Quentin Richard on 02/08/2019.
//  Copyright © 2019 QuentinRichard. All rights reserved.
//

import Foundation

protocol WeatherListCellInterface {
    // *****************************************************************************************************************
    // MARK: - Variable
    var date: String { get }
    var city: String { get }
    var temperature: String { get }
    var humidity: String { get }
}
