//
//  WeatherUtilites.swift
//  Weather
//
//  Created by Shafquat Mahbub on 17/10/23.
//

import Foundation

final class WeatherUtilites {
    private init() {}

    public enum WeatherConditions: String {
        case clearSky = "Clear sky"
        case mainlyClear = "Mainly clear"
        case partlyCloudy = "Partly cloudy"
        case overcast = "Overcast"
        case fog = "Fog"
        case depositingRimeFog = "Depositing rime fog"
        case drizzle = "Drizzle"
        case freezingDrizzle = "Freezing Drizzle"
        case rain = "Rain"
        case freezingRain = "Freezing Rain"
        case snowFall = "Snow fall"
        case snowGrains = "Snow grains"
        case rainShowers = "Rain showers"
        case snowShowers = "Snow showers slight and heavy"
        case thunderstorm = "Thunderstorm"
        case thunderstormWithHail = "Thunderstorm with hail"
        case unrecognized = "Unrecognized weather"
    }

    

    /// Returns description for WMO Weather interpretation codes
    /// Source: https://open-meteo.com/en/docs
    /// - Parameter wmoCode: World Meteorological Organization code `Int`
    /// - Returns: A `WeatherConditions` enum
    public static func getWMODescription(for wmoCode: Int) -> WeatherConditions {
        switch (wmoCode) {
        case 0:
            return .clearSky
        case 1:
            return .mainlyClear
        case 2:
            return .partlyCloudy
        case 3:
            return .overcast
        case 45:
            return .fog
        case 48:
            return .depositingRimeFog
        case 51, 53, 55: // light, moderate and dense
            return .drizzle
        case 56, 57: // light and dense
            return .freezingDrizzle
        case 61, 63, 65: // slight, moderate, and heavy
            return .rain
        case 66, 67: // slight, and heavy
            return .freezingRain
        case 71, 73, 75: // slight, moderate, and heavy
            return .snowFall
        case 77:
            return .snowGrains
        case 80, 81, 82: // Slight, moderate, and violent
            return .rainShowers
        case 85, 86: // slight and heavy
            return .snowShowers
        case 95: // slight or moderate
            return .thunderstorm
        case 96, 99: // slight and heavy
            return .thunderstormWithHail
        default:
            return .unrecognized
        }
    }


    /// Returns an SF Symbol 5 icon for weather condition
    /// - Parameter weatherCondition: an enum of type `WeatherConditions`
    /// - Returns: `String`, name of the symbol
    public static func getWeatherImage(for weatherCondition: WeatherConditions) -> String {
        switch(weatherCondition) {
        case .clearSky:
            return "sun.max"
        case .mainlyClear:
            return "sun.min"
        case .partlyCloudy:
            return "cloud.sun"
        case .overcast:
            return "cloud"
        case .fog:
            return "cloud.fog"
        case .depositingRimeFog:
            return "cloud.fog"
        case .drizzle:
            return "cloud.drizzle"
        case .freezingDrizzle:
            return "cloud.drizzle"
        case .rain:
            return "cloud.rain"
        case .freezingRain:
            return "cloud.rain"
        case .snowFall:
            return "cloud.snow"
        case .snowGrains:
            return "snowflake"
        case .rainShowers:
            return "cloud.heavyrain"
        case .snowShowers:
            return "wind.snow"
        case .thunderstorm:
            return "cloud.bolt.rain"
        case .thunderstormWithHail:
            return "cloud.hail"
        case .unrecognized:
            return "questionmark"
        }
    }
}
