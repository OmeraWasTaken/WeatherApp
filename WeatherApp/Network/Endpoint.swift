//
//  Endpoint.swift
//  WeatherApp
//
//  Created by Quentin Richard on 03/08/2019.
//  Copyright © 2019 QuentinRichard. All rights reserved.
//

import Foundation

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]

    let authKey: String = Environment.authKey
    let apiKey: String = Environment.apiKey
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "www.infoclimat.fr"
        components.path = path
        components.queryItems = queryItems
        components.percentEncodedQueryItems?.append(URLQueryItem(name: "_auth", value: authKey))
        components.queryItems?.append(URLQueryItem(name: "_c", value: apiKey))

        return components.url
    }
}

extension Endpoint {
    static func forecast(lat: Double, long: Double) -> Endpoint {
        let localisation = String(lat) + "," + String(long)
        return Endpoint(path: "/public-api/gfs/json",
                        queryItems: [URLQueryItem(name: "_ll", value: localisation)])
    }
}
