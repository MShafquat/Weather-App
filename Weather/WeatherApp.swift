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

    var body: some Scene {
        WindowGroup {
            HomeView(locationManager: locationManager)
                .onAppear() {
                    locationManager.startUpdatingLocation()
                }
        }
    }
}
