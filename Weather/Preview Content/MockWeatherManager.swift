//
//  MockWeatherManager.swift
//  Weather
//
//  Created by Shafquat Mahbub on 22/10/23.
//

import Foundation

class MockWeatherManager: WeatherDataManager {
    override init() {
        super.init()
        weatherData = previewForecast
    }
}
