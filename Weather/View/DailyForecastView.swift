//
//  DailyForecastView.swift
//  Weather
//
//  Created by Shafquat Mahbub on 23/10/23.
//

import SwiftUI

struct DailyForecastView: View {
    @Binding var weatherData: WeatherData?

    var body: some View {
        guard let weatherData = weatherData else {
            return AnyView(EmptyView())
        }

        let view = AnyView(
            VStack(alignment: .leading, spacing: 0) {
                Text("Daily Weather Forecast")
                    .font(.headline)
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(weatherData.dailyForecast.prefix(7)) { forecast in
                        DailyView(forecast: forecast, units: weatherData.units)
                    }
                }
            }
            .padding()
        )
        return view
    }
}

struct DailyView: View {
    var forecast: DailyForecast
    var units: Units

    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text("\(forecast.time.getShortDateWithDay())")
                HStack {
                    HStack {
                        Image(systemName: "sunrise")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("\(forecast.sunrise.getTime())")
                    }
                    HStack {
                        Image(systemName: "sunset")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("\(forecast.sunset.getTime())")
                    }
                }
                .font(.caption2)
            }
            Spacer()
            Image(systemName: WeatherUtilites.getWeatherImage(for: WeatherUtilites.getWMODescription(for: forecast.weathercode)))
                .resizable()
                .frame(width: 50, height: 50)
            Spacer()
            VStack(alignment: .trailing) {
                Text("\(forecast.temperatureMax.toString())\(units.temperature)")
                    .font(.subheadline)
                Text("\(forecast.temperatureMin.toString())\(units.temperature)")
                    .font(.subheadline)
            }
        }
        .padding([.trailing, .vertical])
    }
}

#Preview {
    DailyForecastView(weatherData: .constant(previewForecast))
}
