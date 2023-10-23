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
    @Published var lastLocationCoordinate: CLLocationCoordinate2D? {
        didSet {
            // start remaining tasks on setting location
            self.onLocationUpdated?(lastLocationCoordinate)
        }
    }
    @Published var lastLocationName: String?
    private var previousLocationName: String?

    var onLocationUpdated: ((CLLocationCoordinate2D?) -> Void)?

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.onLocationUpdated = nil
    }

    public func requestAuthorisation() {
        self.locationManager.requestWhenInUseAuthorization()
    }

    private func isAuthorized(authorizationStatus: CLAuthorizationStatus) -> Bool {
#if os(iOS)
        let isNotAuthorized = authorisationStatus != .authorizedWhenInUse && authorisationStatus != .authorizedAlways
#elseif os(macOS)
        let isNotAuthorized = authorisationStatus != .authorized && authorisationStatus != .authorizedAlways
#else
        let isNotAuthorized = true
#endif
        return !isNotAuthorized
    }

    public func startUpdatingLocation() {
        if !isAuthorized(authorizationStatus: authorisationStatus) {
            requestAuthorisation()
        } else {
            self.locationManager.startUpdatingLocation()
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.authorisationStatus = status
        if isAuthorized(authorizationStatus: authorisationStatus) {
            startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.getPlaceName(location: location)
    }

    public func getPlaceName(location: CLLocation) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks , error in
            if error == nil && placemarks!.count > 0 {
                guard let placemark = placemarks?.last else { return }
                let currentLocationName = "\(placemark.name ?? "Unknown Place"), \(placemark.locality ?? "Unknown City"), \(placemark.country ?? "Unknown Country")"
                guard currentLocationName != self.previousLocationName else { return } // still in the same place, skip for network call optimization
                self.previousLocationName = currentLocationName // save latest location placemark
                self.lastLocationCoordinate = location.coordinate // save current coordinate
                self.lastLocationName = currentLocationName
            }
        }
    }
}
