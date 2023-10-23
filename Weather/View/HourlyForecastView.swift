//
//  HourlyForecastView.swift
//  Weather
//
//  Created by Shafquat Mahbub on 19/10/23.
//

import SwiftUI

struct HourlyForecastView: View {
    var weatherData: WeatherData!

    var body: some View {
        let view = AnyView(
            VStack(alignment: .leading, spacing: 0) {
                Text("Hourly Weather Forecast")
                    .font(.headline)
                ScrollView (.horizontal, showsIndicators: true) {
                    HStack {
                        ForEach(weatherData.hourlyForecast.filter { $0.time > Date() } .prefix(12)) { forecast in
                            HourView(forecast: forecast, units: weatherData.units)
                        }
                    }
                }
            }
            .padding()
            .background(.gray.opacity(0.25))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        )
        return view
    }
}

struct HourView: View {
    var forecast: HourlyForecast
    var units: Units

    var body: some View {
        VStack(spacing: -10) {
            Text(forecast.time.getTime())
                .font(.headline)
            VStack {
                Image(systemName: WeatherUtilites.getWeatherImage(for: WeatherUtilites.getWMODescription(for: forecast.weathercode)))
                    .resizable()
                    .font(.subheadline)
                    .frame(width: 50, height: 50)
                Text("\(forecast.temperature.toString())\(units.temperature)")
                    .font(.subheadline)
                HStack(spacing: 1) {
                    Image(systemName: "umbrella")
                    Text("\(forecast.precipitationProbability.toString(toPlace: 0))%")
                }
            }
            .padding(30)
            .background(.linearGradient(Gradient(colors: [.white, .gray.opacity(0.5)]), startPoint: .top, endPoint: .bottom))
            .clipShape(Circle())
        }
    }
}

#Preview {
    HourlyForecastView(weatherData: previewForecast)
}
