//
//  API.swift
//  WeatherApp
//
//  Created by Quentin Richard on 03/08/2019.
//  Copyright © 2019 QuentinRichard. All rights reserved.
//

import Foundation

enum ApiError: Error {
    case invalidUrl
    case unknow
}

final class API {
    static let shared = API()
    let urlSession = URLSession(configuration: .default)

    func request(_ endPoint: Endpoint, then handler: @escaping (Result<Data, Error>) -> Void) {
        guard let url = endPoint.url else {
            return handler(.failure(ApiError.invalidUrl))
        }

        let task = urlSession.dataTask(with: url) { data, _, error in
            let result = data.map { Result.success($0) } ?? Result.failure(ApiError.unknow as Error)
            handler(result)
        }
        task.resume()
    }

    func resultDecoder<Object: Decodable>(_ result: Result<Data, Error>, handler: @escaping (Result<Object?, Error>) -> Void) {
        switch result {
        case .success(let data):
            let decoder = JSONDecoder()
            let object = try? decoder.decode(Object.self, from: data)
            handler(.success(object))
        case .failure(let error):
            handler(.failure(error))
        }
    }

    func getWeather(lat: Double, long: Double, handler: @escaping (Result<Forecast?, Error>) -> Void) {
        let endpoint = Endpoint.forecast(lat: lat, long: long)
        request(endpoint, then: {[weak self] result in
            self?.resultDecoder(result, handler: handler)
        })
    }
}
