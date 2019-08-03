//
//  NSObjectExtension.swift
//  WeatherApp
//
//  Created by Quentin Richard on 03/08/2019.
//  Copyright © 2019 QuentinRichard. All rights reserved.
//

import Foundation

public extension NSObject {
    class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }

    class var bundle: Bundle {
        return Bundle(for: self)
    }
}
