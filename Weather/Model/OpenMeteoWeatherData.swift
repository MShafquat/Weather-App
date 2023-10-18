//
//  OpenMeteoWeatherData.swift
//  Weather
//
//  Created by Shafquat Mahbub on 11/10/23.
//

import Foundation

struct OpenMeteoWeatherData: Codable {
    let latitude: Double
    let longitude: Double
    let timezone: String
    let elevation: Double

    let current: CurrentData
    let current_units: CurrentUnits
    let hourly: HourlyData
    let daily: DailyData
}

struct CurrentUnits: Codable {
    let time: String
    let temperature_2m: String
    let windspeed_10m: String
    let precipitation: String
    let weathercode: String
}

struct CurrentData: Codable {
    let time: String
    let temperature_2m: Double
    let windspeed_10m: Double
    let precipitation: Double
    let weathercode: Int
    let is_day: Int
}

struct HourlyData: Codable {
    let time: [String]
    let temperature_2m: [Double]
    let windspeed_10m: [Double]
    let precipitation_probability: [Double]
    let weathercode: [Int]
    let is_day: [Int]
}

struct DailyData: Codable {
    let time: [String]
    let sunrise: [String]
    let sunset: [String]
    let temperature_2m_max: [Double]
    let temperature_2m_min: [Double]
    let precipitation_sum: [Double]
    let weathercode: [Int]
}
