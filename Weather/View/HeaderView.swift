//
//  HeaderView.swift
//  Weather
//
//  Created by Shafquat Mahbub on 11/10/23.
//

import SwiftUI

struct HeaderView: View {
    @Binding var lastLocationName: String?
    @Binding var weatherData: OpenMeteoWeatherData?

    var body: some View {
        guard let weatherData = weatherData, let lastLocationName = lastLocationName else {
            return AnyView(EmptyView())
        }
        let view = ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            HStack(alignment: .lastTextBaseline) {
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
                        Text("\(weatherData.current.temperature_2m.toString())\(weatherData.current_units.temperature_2m)")
                            .font(.largeTitle)
                    }
                    .accessibilityLabel("Current temperature: \(weatherData.current.temperature_2m.toString())\(weatherData.current_units.temperature_2m)")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    VStack(alignment: .trailing) {
                        Image(systemName: WeatherUtilites.getWeatherImage(for: WeatherUtilites.getWMODescription(for: weatherData.current.weathercode)))
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("\(WeatherUtilites.getWMODescription(for: weatherData.current.weathercode).rawValue)")
                            .font(.headline)
                    }
                    .accessibilityLabel("Current weather condition: \(WeatherUtilites.getWMODescription(for: weatherData.current.weathercode).rawValue)")
                    HStack {
                        Text("\(weatherData.current.windspeed_10m.toString()) \(weatherData.current_units.windspeed_10m)")
                        Image(systemName: "wind")
                    }
                    .accessibilityLabel("Current windspeed: \(weatherData.current.windspeed_10m.toString()) \(weatherData.current_units.windspeed_10m)")
                }
            }
            .preferredColorScheme(.dark)
            .padding()
        }
        return AnyView(view)
    }
}

#Preview {
    return HeaderView(lastLocationName: .constant("Dhaka, Bangladesh"), weatherData: .constant(previewForecast))
}
