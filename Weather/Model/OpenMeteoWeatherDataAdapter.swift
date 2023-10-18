//
//  OpenMeteoWeatherDataAdapter.swift
//  Weather
//
//  Created by Shafquat Mahbub on 19/10/23.
//

import Foundation

struct OpenMeteoWeatherDataAdapter {

    private static func getDate(from isoFormattedString: String) -> Date {
        let dateFormatter = DateFormatter()
        if isoFormattedString.contains("T") {
            dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm'"
        } else {
            dateFormatter.dateFormat = "yyyy'-'MM'-'dd'"
        }
        return dateFormatter.date(from: isoFormattedString)!
    }

    public static func convertToWeatherData(from openMeteoWeatherData: OpenMeteoWeatherData) -> WeatherData {
        let units = convertToUnits(from: openMeteoWeatherData.current_units)
        let currentWeather = convertToCurrentWeather(from: openMeteoWeatherData.current)
        let hourlyForecasts = convertToHourlyForecastArray(from: openMeteoWeatherData.hourly)
        let dailyForecasts = convertToDailyForecastArray(from: openMeteoWeatherData.daily)

        return WeatherData(timezone: openMeteoWeatherData.timezone, elevation: openMeteoWeatherData.elevation, currentWeather: currentWeather, units: units, hourlyForecast: hourlyForecasts, dailyForecast: dailyForecasts)
    }

    private static func convertToUnits(from currentUnits: CurrentUnits) -> Units {
        return Units(time: currentUnits.time, temperature: currentUnits.temperature_2m, windspeed: currentUnits.windspeed_10m, precipitation: currentUnits.precipitation, weathercode: currentUnits.weathercode)
    }

    private static func convertToCurrentWeather(from currentData: CurrentData) -> CurrentWeather {
        return CurrentWeather(time: getDate(from: currentData.time), temperature: currentData.temperature_2m, windspeed: currentData.windspeed_10m, precipitation: currentData.precipitation, weathercode: currentData.weathercode, isDay: currentData.is_day)
    }

    private static func convertToHourlyForecastArray(from hourlyData: HourlyData) -> [HourlyForecast] {
        let numOfElements = hourlyData.time.count
        var hourlyForecasts = [HourlyForecast]()

        for i in 0 ..< numOfElements {
            hourlyForecasts.append(HourlyForecast(time: getDate(from: hourlyData.time[i]), temperature: hourlyData.temperature_2m[i], windspeed: hourlyData.windspeed_10m[i], precipitationProbability: hourlyData.precipitation_probability[i], weathercode: hourlyData.weathercode[i], isDay: hourlyData.is_day[i]))
        }
        return hourlyForecasts
    }

    private static func convertToDailyForecastArray(from dailyData: DailyData) -> [DailyForecast] {
        let numOfElements = dailyData.time.count
        var dailyForecasts = [DailyForecast]()

        for i in 0..<numOfElements {
            dailyForecasts.append(DailyForecast(time: getDate(from: dailyData.time[i]), sunrise: dailyData.sunrise[i], sunset: dailyData.sunset[i], temperatureMax: dailyData.temperature_2m_max[i], temperatureMin: dailyData.temperature_2m_min[i], precipitationSum: dailyData.precipitation_sum[i], weathercode: dailyData.weathercode[i]))
        }
        return dailyForecasts
    }
}
