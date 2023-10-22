//
//  WeatherApp.swift
//  Weather
//
//  Created by Shafquat Mahbub on 11/10/23.
//

import SwiftUI

@main
struct WeatherApp: App {
    @StateObject var locationManager = LocationManager()
    @StateObject var weatherDataManager = WeatherDataManager()

    var body: some Scene {
        WindowGroup {
            HomeView(locationManager: locationManager, weatherDataManager: weatherDataManager)
                .onAppear() {
                    locationManager.startUpdatingLocation()
                    locationManager.onLocationUpdated = { location in
                        guard let location = location else { return }
                        weatherDataManager.weatherData = nil
                        weatherDataManager.getWeatherData(latitude: location.latitude, longitude: location.longitude)
                    }
                }
                .preferredColorScheme(.dark)
        }
    }
}
