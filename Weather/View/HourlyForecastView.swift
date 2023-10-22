//
//  HourlyForecastView.swift
//  Weather
//
//  Created by Shafquat Mahbub on 19/10/23.
//

import SwiftUI

struct HourlyForecastView: View {
    @Binding var weatherData: WeatherData?

    var body: some View {
        guard let weatherData = weatherData else {
            return AnyView(EmptyView())
        }

        let view = AnyView(
            VStack(alignment: .leading, spacing: 0) {
                Text("Hourly Weather Forecast")
                    .font(.headline)
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(weatherData.hourlyForecast.prefix(12)) { forecast in
                            HourView(forecast: forecast, units: weatherData.units)
                        }
                    }
                }
            }
            .padding()
        )
        return view
    }
}

struct HourView: View {
    var forecast: HourlyForecast
    var units: Units
    let dateFormatter = DateFormatter()
    let outputDateFormatter = DateFormatter()

    init(forecast: HourlyForecast, units: Units) {
        self.forecast = forecast
        self.units = units
        dateFormatter.dateFormat = "hh':'mm' 'aa'"
    }

    var body: some View {
        VStack {
            Text(dateFormatter.string(from: forecast.time))
                .font(.headline)
            Image(systemName: WeatherUtilites.getWeatherImage(for: WeatherUtilites.getWMODescription(for: forecast.weathercode)))
                .resizable()
                .frame(width: 50, height: 50)
            Text("\(forecast.temperature.toString())\(units.temperature)")
                .font(.subheadline)
        }
        .padding([.top, .bottom, .trailing])
    }
}

#Preview {
    HourlyForecastView(weatherData: .constant(previewForecast))
}
