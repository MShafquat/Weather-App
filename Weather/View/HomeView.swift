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
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            ScrollView {
                HeaderView(lastLocationName: $locationManager.lastLocationName, weatherData: $weatherDataManager.weatherData)
                .preferredColorScheme(.dark)
                HourlyForecastView(weatherData: $weatherDataManager.weatherData)
                DailyForecastView(weatherData: $weatherDataManager.weatherData)
            }
            .padding()
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    HomeView(locationManager: MockLocationManager(), weatherDataManager: MockWeatherManager())
}
