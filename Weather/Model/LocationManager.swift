//
//  LocationManager.swift
//  Weather
//
//  Created by Shafquat Mahbub on 11/10/23.
//

import CoreLocation
import Foundation

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    @Published var authorisationStatus: CLAuthorizationStatus = .notDetermined
    @Published var lastLocationCoordinate: CLLocationCoordinate2D?
    @Published var lastLocationName: String?
    var onLocationUpdated: ((Double, Double) -> Void)?

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.onLocationUpdated = nil
    }

    public func requestAuthorisation() {
        self.locationManager.requestWhenInUseAuthorization()
    }

    public func startUpdatingLocation() {
        if authorisationStatus != .authorizedWhenInUse && authorisationStatus != .authorizedAlways {
            requestAuthorisation()
        } else {
            self.locationManager.startUpdatingLocation()
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.authorisationStatus = status
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        lastLocationCoordinate = location.coordinate
        getPlaceName(location: location)
        onLocationUpdated?(location.coordinate.latitude, location.coordinate.longitude)
    }

    public func getPlaceName(location: CLLocation) {
        lastLocationName = nil
        CLGeocoder().reverseGeocodeLocation(location) { placemarks , error in
            if error == nil && placemarks!.count > 0 {
                guard let placemark = placemarks?.last else { return }
                self.lastLocationName = "\(placemark.name ?? "Unknown Place"), \(placemark.locality ?? "Unknown City"), \(placemark.country ?? "Unknown Country")"
            }
        }
    }
}
