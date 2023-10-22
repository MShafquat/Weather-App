//
//  WeatherData.swift
//  Weather
//
//  Created by Shafquat Mahbub on 19/10/23.
//

import Foundation

struct WeatherData {
    let timezone: String
    let elevation: Double

    let currentWeather: CurrentWeather
    let units: Units
    let hourlyForecast: [HourlyForecast]
    let dailyForecast: [DailyForecast]
}

struct Units {
    let time: String
    let temperature: String
    let windspeed: String
    let precipitation: String
    let weathercode: String
}

struct CurrentWeather {
    let time: Date
    let temperature: Double
    let windspeed: Double
    let precipitation: Double
    let weathercode: Int
    let isDay: Int
}

struct HourlyForecast: Identifiable {
    let id = UUID()
    let time: Date
    let temperature: Double
    let windspeed: Double
    let precipitationProbability: Double
    let weathercode: Int
    let isDay: Int
}

struct DailyForecast: Identifiable {
    let id = UUID()
    let time: Date
    let sunrise: Date
    let sunset: Date
    let temperatureMax: Double
    let temperatureMin: Double
    let precipitationSum: Double
    let weathercode: Int
}
