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
        guard let lastLocationName = locationManager.lastLocationName, let weatherData = weatherDataManager.weatherData else {
            return AnyView(EmptyView())
        }
        return AnyView(ZStack {
            Color(.brown)
                .ignoresSafeArea()
            ScrollView {
                HeaderView(lastLocationName: lastLocationName, weatherData: weatherData)
                HourlyForecastView(weatherData: weatherData)
                DailyForecastView(weatherData: weatherData)
            }
        })
    }
}

#Preview {
    HomeView(locationManager: MockLocationManager(), weatherDataManager: MockWeatherManager())
}
