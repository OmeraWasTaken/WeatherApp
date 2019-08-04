//
//  CodingByKey.swift
//  WeatherApp
//
//  Created by Quentin Richard on 04/08/2019.
//  Copyright © 2019 QuentinRichard. All rights reserved.
//

import Foundation

struct CodingByKey: CodingKey {
    var stringValue: String
    var intValue: Int?

    init?(stringValue: String) {
        self.stringValue = stringValue
    }

    init?(intValue: Int) {
        self.intValue = intValue
        self.stringValue = String(intValue)
    }

    static func makeKey(name: String) -> CodingByKey {
        return CodingByKey(stringValue: name)!
    }
}
