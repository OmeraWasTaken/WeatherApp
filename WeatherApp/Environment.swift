//
//  Environment.swift
//  WeatherApp
//
//  Created by Quentin Richard on 03/08/2019.
//  Copyright © 2019 QuentinRichard. All rights reserved.
//

import Foundation

public enum Environment {
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()

    static let authKey: String = {
        guard let authKey = Environment.infoDictionary["AuthKey"] as? String, authKey != "" else {
            fatalError("Please set your Auth key in Info.plist")
        }
        return authKey
    }()

    static let apiKey: String = {
        guard let apiKey = Environment.infoDictionary["ApiKey"] as? String, apiKey != "" else {
            fatalError("Please set your API key in Info.plist")
        }
        return apiKey
    }()
}
