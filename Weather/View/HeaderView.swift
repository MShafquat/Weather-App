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
        let view = HStack {
            VStack(alignment: .leading) {
                Text(lastLocationName)
                    .font(.headline)
                Text("Current Temperature: \(String(format: "%.1f", weatherData.current.temperature_2m))\(weatherData.current_units.temperature_2m)")
                    .font(.subheadline)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("\(weatherData.current.rain == 0 ? "Not raining" : "Raining")")
                    .font(.subheadline)
                Text("Current windspeed: \(String(format: "%.1f", weatherData.current.windspeed_10m)) \(weatherData.current_units.windspeed_10m)")
                    .font(.subheadline)
            }
        }
        .padding()
        return AnyView(view)
    }
}

#Preview {
    return HeaderView(lastLocationName: .constant("Dhaka, Bangladesh"), weatherData: .constant(OpenMeteoWeatherData.sample))
}
