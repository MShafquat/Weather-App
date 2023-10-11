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
        Text(lastLocationName ?? "")
            .font(.headline)
        if let temperature = weatherData?.current.temperature_2m, let temperatureUnit = weatherData?.current_units.temperature_2m {
            Text("Current Temperature: \(String(format: "%.1f", temperature))\(temperatureUnit)")
                .font(.subheadline)
        }
    }
}

#Preview {
    HeaderView(lastLocationName: .constant("Dhaka, Bangladesh"), weatherData: .constant(nil))
}
