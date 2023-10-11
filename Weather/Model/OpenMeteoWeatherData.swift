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
    let current_units: CurrentUnit
    let hourly: HourlyData
    let daily: DailyData

    static let sample = OpenMeteoWeatherData(latitude: 51.5,
                                             longitude: -0.1400001,
                                             timezone: "Europe/London",
                                             elevation: 38,
                                             current: CurrentData.sample,
                                             current_units: CurrentUnit.sample,
                                             hourly: HourlyData.sample,
                                             daily: DailyData.sample)
}

struct CurrentUnit: Codable {
    let time: String
    let temperature_2m: String
    let windspeed_10m: String
    let rain: String

    static let sample = CurrentUnit(time: "iso8601", temperature_2m: "°C", windspeed_10m: "km/h", rain: "mm")
}

struct CurrentData: Codable {
    let time: String
    let temperature_2m: Double
    let windspeed_10m: Double
    let is_day: Int
    let rain: Double

    static let sample = CurrentData(
        time: "2023-10-15T20:00",
        temperature_2m: 7.4,
        windspeed_10m: 3.3,
        is_day: 0,
        rain: 0
    )
}

struct HourlyData: Codable {
    let time: [String]
    let temperature_2m: [Double]
    let windspeed_10m: [Double]
    let is_day: [Int]
    let rain: [Double]

    static let sample = HourlyData(
        time: ["2023-10-15T00:00",
               "2023-10-15T01:00",
               "2023-10-15T02:00",
               "2023-10-15T03:00",
               "2023-10-15T04:00",],
        temperature_2m: [7.8, 7.4, 6.9, 6.6, 6.2],
        windspeed_10m: [6.2, 8.1, 8.5, 8.9, 9.3],
        is_day: [0,0,0,1,1],
        rain: [0, 0.1, 0.4, 0.3, 0.1,]
    )
}

struct DailyData: Codable {
    let time: [String]
    let sunrise: [String]
    let sunset: [String]

    static let sample = DailyData(
        time: ["2023-10-15",
               "2023-10-16",
               "2023-10-17",
               "2023-10-18",
               "2023-10-19",
               "2023-10-20",
               "2023-10-21"],
        sunrise: ["2023-10-15T07:24",
                  "2023-10-16T07:26",
                  "2023-10-17T07:27",
                  "2023-10-18T07:29",
                  "2023-10-19T07:31",
                  "2023-10-20T07:32",
                  "2023-10-21T07:34"],
        sunset: ["2023-10-15T18:08",
                 "2023-10-16T18:06",
                 "2023-10-17T18:04",
                 "2023-10-18T18:01",
                 "2023-10-19T17:59",
                 "2023-10-20T17:57",
                 "2023-10-21T17:55"])
}
