//
//  DailyForecastView.swift
//  Weather
//
//  Created by Shafquat Mahbub on 23/10/23.
//

import SwiftUI

struct DailyForecastView: View {
    var weatherData: WeatherData!

    var body: some View {

        let view = AnyView(
            VStack(alignment: .leading, spacing: 0) {
                Text("Daily Weather Forecast")
                    .font(.headline)
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(weatherData.dailyForecast.filter{ $0.time >= Date() }.prefix(7)) { forecast in
                        DailyView(forecast: forecast, units: weatherData.units)
                        Spacer(minLength: 5)
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
                HStack(spacing: 1) {
                    Image(systemName: "arrow.up.circle")
                    Text("\(forecast.temperatureMax.toString())\(units.temperature)")
                }
                .font(.subheadline)
                HStack(spacing: 1) {
                    Image(systemName: "arrow.down.circle")
                    Text("\(forecast.temperatureMin.toString())\(units.temperature)")
                }
                .font(.subheadline)
                HStack(spacing: 1) {
                    Image(systemName: "umbrella")
                    Text("\(forecast.precipitationSum.toString()) \(units.precipitation)")
                }
                .font(.subheadline)
            }
        }
        .padding([.trailing, .vertical])
        .background(.linearGradient(Gradient(colors: [.gray.opacity(0.20), .gray.opacity(0.50)]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    DailyForecastView(weatherData: previewForecast)
}
