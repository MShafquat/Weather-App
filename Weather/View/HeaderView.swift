//
//  HeaderView.swift
//  Weather
//
//  Created by Shafquat Mahbub on 11/10/23.
//

import SwiftUI

struct HeaderView: View {
    @Binding var lastLocationName: String?
    @Binding var weatherData: WeatherData?

    var body: some View {
        guard let weatherData = weatherData, let lastLocationName = lastLocationName else {
            return AnyView(EmptyView())
        }
        let view = HStack(alignment: .lastTextBaseline) {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "location")
                        .font(.subheadline)
                    Text(lastLocationName)
                        .font(.subheadline)
                }
                .accessibilityLabel("Current location: \(lastLocationName)")
                HStack {
                    Image(systemName: "clock")
                        .font(.subheadline)
                    Text("\(Date().formatted())")
                        .font(.subheadline)
                }
                .accessibilityLabel("Updated time: \(Date().formatted())")
                HStack {
                    Image(systemName: "thermometer")
                        .font(.largeTitle)
                    Text("\(weatherData.currentWeather.temperature.toString())\(weatherData.units.temperature)")
                        .font(.largeTitle)
                }
                .accessibilityLabel("Current temperature: \(weatherData.currentWeather.temperature.toString())\(weatherData.units.temperature)")
            }
            Spacer()
            VStack(alignment: .trailing) {
                VStack(alignment: .trailing) {
                    Image(systemName: WeatherUtilites.getWeatherImage(for: WeatherUtilites.getWMODescription(for: weatherData.currentWeather.weathercode)))
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text("\(WeatherUtilites.getWMODescription(for: weatherData.currentWeather.weathercode).rawValue)")
                        .font(.headline)
                }
                .accessibilityLabel("Current weather condition: \(WeatherUtilites.getWMODescription(for: weatherData.currentWeather.weathercode).rawValue)")
                HStack {
                    Text("\(weatherData.currentWeather.windspeed.toString()) \(weatherData.units.windspeed)")
                    Image(systemName: "wind")
                }
                .accessibilityLabel("Current windspeed: \(weatherData.currentWeather.windspeed.toString()) \(weatherData.units.windspeed)")
            }
        }
        .preferredColorScheme(.dark)
        .padding()
        return AnyView(view)
    }
}

#Preview {
    return HeaderView(lastLocationName: .constant("Dhaka, Bangladesh"), weatherData: .constant(previewForecast))
}
