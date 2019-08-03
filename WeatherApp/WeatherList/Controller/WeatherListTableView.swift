//
//  WeatherListTableView.swift
//  WetherApp
//
//  Created by Quentin Richard on 02/08/2019.
//  Copyright © 2019 QuentinRichard. All rights reserved.
//

import CoreLocation
import MapKit
import UIKit

final class WeatherListTableView: BaseViewController, CLLocationManagerDelegate {
    // *****************************************************************************************************************
    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!

    // *****************************************************************************************************************
    // MARK: - Variable
    var viewModel: WeatherListInterface
    let locationManager = CLLocationManager()

    init(with viewModel: WeatherListInterface) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: WeatherListTableView.bundle)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        setupLocalisation()
        bindRefreshAction()
    }
}

private extension WeatherListTableView {
    // *****************************************************************************************************************
    // MARK: - setupView
    func setupTableView() {
        tableView.register(UINib(nibName: WeatherListCell.nameOfClass, bundle: nil),
                           forCellReuseIdentifier: WeatherListCell.nameOfClass)
        tableView.delegate = self
        tableView.dataSource = self
    }

    func setupLocalisation() {
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            viewModel.getWeather(lat: locationManager.location?.coordinate.latitude ?? 48.85341,
                                 long: locationManager.location?.coordinate.longitude ?? 2.3488)
            viewModel.getCity(location: locationManager.location ?? CLLocation(latitude: 48.85341,
                                                                               longitude: 2.3488))
        }
    }

    func bindRefreshAction() {
        viewModel.refreshTableViewAction = {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
}

extension WeatherListTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dates.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherListCell.nameOfClass,
                                                       for: indexPath) as? WeatherListCell else {
                                                        return UITableViewCell()
        }
        let date = viewModel.dates[indexPath.item]
        let forecast = viewModel.getForecastByDay(date: date)
        let viewModel = WeatherListCellViewModel(date: date,
                                                 city: self.viewModel.city,
                                                 temperature: forecast.first?.weather.temperature ?? 0,
                                                 humidity: forecast.first?.weather.humidity ?? 0.0)
        cell.setup(with: viewModel)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let date = viewModel.dates[indexPath.item]
        let forecast = viewModel.getForecastByDay(date: date)
        viewModel.cellDidTap(forecast)
    }
}
