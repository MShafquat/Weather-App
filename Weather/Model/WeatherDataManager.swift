//
//  WeatherDataManager.swift
//  Weather
//
//  Created by Shafquat Mahbub on 11/10/23.
//

import SwiftUI

@MainActor
class WeatherDataManager: ObservableObject {
    @Published var weatherData: OpenMeteoWeatherData?

    private func performOpenMeteoAPICall(latitude: Double, longitude: Double) async throws -> OpenMeteoWeatherData {
        let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=\(latitude)&longitude=\(longitude)&current=temperature_2m,windspeed_10m,is_day,precipitation,weathercode&hourly=temperature_2m,windspeed_10m,precipitation_probability,weathercode,is_day&daily=temperature_2m_max,temperature_2m_min,precipitation_sum,weathercode,sunrise,sunset&timezone=auto")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let openMeteoWeatherData = try JSONDecoder().decode(OpenMeteoWeatherData.self, from: data)
        return openMeteoWeatherData
    }

    public func getWeatherData(latitude: Double, longitude: Double) {
        Task {
            weatherData = try await performOpenMeteoAPICall(latitude:latitude, longitude:longitude)
        }
    }
}
