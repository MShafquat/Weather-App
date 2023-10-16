//
//  HomeView.swift
//  Weather
//
//  Created by Shafquat Mahbub on 11/10/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var locationManager: LocationManager
    @ObservedObject var weatherDataManager: WeatherDataManager

    var body: some View {
        HeaderView(lastLocationName: $locationManager.lastLocationName, weatherData: $weatherDataManager.weatherData)
            .onChange(of: locationManager) { _, newValue in
                weatherDataManager.getWeatherData(latitude: newValue.lastLocationCoordinate?.latitude ?? 0, longitude: newValue.lastLocationCoordinate?.longitude ?? 0)
            }
            .preferredColorScheme(.dark)
    }
}

#Preview {
    HomeView(locationManager: LocationManager(), weatherDataManager: WeatherDataManager())
}
