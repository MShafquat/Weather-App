//
//  MockLocationManager.swift
//  Weather
//
//  Created by Shafquat Mahbub on 23/10/23.
//

import CoreLocation
import Foundation

class MockLocationManager: LocationManager {
    override init() {
        super.init()
        #if os(iOS)
        authorisationStatus = .authorizedWhenInUse
        #elseif os(macOS)
        authorisationStatus = .authorized
        #endif
        lastLocationCoordinate = CLLocationCoordinate2D(latitude: 23, longitude: 89)
        lastLocationName = "Dhaka, Bangladesh"
    }
}
