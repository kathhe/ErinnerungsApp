//
//  LocationEnvironment.swift
//  ErinnerungsApp
//
//  Created by Kathrine Heinzel 875340
//

import Foundation
import CoreLocation

class LocationEnvironment: NSObject, CLLocationManagerDelegate, ObservableObject {
    var locationManager = CLLocationManager()
    var locations = locationCoords
    @Published var currentPosition = ""

    // Stationen werden hier zu den Regionen hinzugefügt, die beobachtet werden
    lazy var addedStationen = addStationen()

    // Diese Methode wird beim erstmaligen Laden der App ausgeführt
    func initPositionService() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
        // Die Regionen werden überwacht
        if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
            for addedStation in addedStationen {
                locationManager.startMonitoring(for: addedStation)
                print("Station: \(addedStation)")
            }
            print("CLLocationManager-Monitoring is available.")
        } else {
            print("CLLocationManager-Monitoring is not available.")
        }
    }
    
    // Letzte position aus dem Array locations wird ausgelesen.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let myLocation = locations.last
        let lat = myLocation?.coordinate.latitude
        let lon = myLocation?.coordinate.longitude
        self.currentPosition = "lat: \(lat ?? 0) lon: \(lon ?? 0)"
    }
    
    // Beim Eintreten in eine Station, wird das Alert angezeigt.
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        let sAlert = StationAlert()
        sAlert.alertAnzeigen("Sie sind hier: \(region.identifier)!")
        print("Sie sind hier: \(region.identifier)")
    }
    
    // Methode, die die Stationen den beobachteten Regionen zufügt.
    private func addStationen() -> [CLCircularRegion] {
        var selectedStationen: [CLCircularRegion] = []
        let lat0 = locationCoords[0].latitude
        let lon0 = locationCoords[0].longitude
        let region0 = CLCircularRegion(
            center: CLLocationCoordinate2D(latitude: lat0, longitude: lon0),
            radius: 2,
            identifier: "Kiosk")
        selectedStationen.append(region0)
        
        let lat1 = locationCoords[1].latitude
        let lon1 = locationCoords[1].longitude
        let region1 = CLCircularRegion(
            center: CLLocationCoordinate2D(latitude: lat1, longitude: lon1),
            radius: 2,
            identifier: "Bäckerei")
        selectedStationen.append(region1)
        
        let lat2 = locationCoords[2].latitude
        let lon2 = locationCoords[2].longitude
        let region2 = CLCircularRegion(
            center: CLLocationCoordinate2D(latitude: lat2, longitude: lon2),
            radius: 2,
            identifier: "Kaufhaus")
        selectedStationen.append(region2)
        
        let lat3 = locationCoords[3].latitude
        let lon3 = locationCoords[3].longitude
        let region3 = CLCircularRegion(
            center: CLLocationCoordinate2D(latitude: lat3, longitude: lon3),
            radius: 2,
            identifier: "Wochenmarkt")
        selectedStationen.append(region3)
        
        let lat4 = locationCoords[4].latitude
        let lon4 = locationCoords[4].longitude
        let region4 = CLCircularRegion(
            center: CLLocationCoordinate2D(latitude: lat4, longitude: lon4),
            radius: 2,
            identifier: "Penny")
        selectedStationen.append(region4)
        
        let lat5 = locationCoords[5].latitude
        let lon5 = locationCoords[5].longitude
        let region5 = CLCircularRegion(
            center: CLLocationCoordinate2D(latitude: lat5, longitude: lon5),
            radius: 2,
            identifier: "Park")
        selectedStationen.append(region5)
        
        return selectedStationen
    }
}
