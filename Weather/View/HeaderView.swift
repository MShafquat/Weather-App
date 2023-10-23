//
//  HeaderView.swift
//  Weather
//
//  Created by Shafquat Mahbub on 11/10/23.
//

import SwiftUI

struct HeaderView: View {
    var lastLocationName: String!
    var weatherData: WeatherData!

    var body: some View {
        let view = HStack(alignment: .lastTextBaseline) {
            VStack(alignment: .leading) {
                Text("\(weatherData.currentWeather.temperature.toString())\(weatherData.units.temperature)")
                    .font(.custom("Impact", size: 50))
                    .accessibilityLabel("Current temperature: \(weatherData.currentWeather.temperature.toString())\(weatherData.units.temperature)")
                HStack {
                    Image(systemName: "location")
                    Text(lastLocationName)
                }
                .font(.headline)
                .accessibilityLabel("Current location: \(lastLocationName)")
                HStack {
                    Image(systemName: "clock")
                    Text("\(Date().formatted())")
                }
                .font(.subheadline)
                .accessibilityLabel("Updated time: \(Date().formatted())")
            }
            Spacer()
            VStack(alignment: .trailing) {
                VStack(alignment: .trailing) {
                    Image(systemName: WeatherUtilites.getWeatherImage(for: WeatherUtilites.getWMODescription(for: weatherData.currentWeather.weathercode)))
                        .resizable()
                        .font(.custom("Impact", size: 50))
                        .frame(width: 50, height: 50)
                    Text("\(WeatherUtilites.getWMODescription(for: weatherData.currentWeather.weathercode).rawValue)")
                        .font(.subheadline)
                }
                .accessibilityLabel("Current weather condition: \(WeatherUtilites.getWMODescription(for: weatherData.currentWeather.weathercode).rawValue)")
                HStack {
                    Text("\(weatherData.currentWeather.windspeed.toString()) \(weatherData.units.windspeed)")
                    Image(systemName: "wind")
                }
                .font(.subheadline)
                .accessibilityLabel("Current windspeed: \(weatherData.currentWeather.windspeed.toString()) \(weatherData.units.windspeed)")
            }
        }
        .padding()
        return AnyView(view)
    }
}

#Preview {
    return HeaderView(lastLocationName: "Dhaka, Bangladesh", weatherData: previewForecast)
}
