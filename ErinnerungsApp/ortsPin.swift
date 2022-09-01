//
//  ortsPin.swift
//  ErinnerungsApp
//
//  Created by Kathrine Heinzel 875340
//

import Foundation
import CoreLocation
import SwiftUI

// Structure für die Stationen
struct MyStationItem: Identifiable {
    var coordinate: CLLocationCoordinate2D
    let id = UUID()
}

// koordinaten von ausgewählten Stationen
var locationCoords: [(latitude: Double, longitude: Double)] = [
    (latitude: 52.504957, longitude: 13.336002),
    (latitude: 52.504979, longitude: 13.335596),
    (latitude: 52.504874, longitude: 13.338104),
    (latitude: 52.505037, longitude: 13.340550),
    (latitude: 52.504435, longitude: 13.343026),
    (latitude: 52.503859, longitude: 13.345401)
]

// Koordinaten werden hier den CLLocationCoordinate2D übergeben, zum erstellen der Rechtecke auf der Karte.
var stationItems: [MyStationItem] = [
    MyStationItem(coordinate: CLLocationCoordinate2D(latitude: locationCoords[0].latitude, longitude: locationCoords[0].longitude)),
    MyStationItem(coordinate: CLLocationCoordinate2D(latitude: locationCoords[1].latitude, longitude: locationCoords[1].longitude)),
    MyStationItem(coordinate: CLLocationCoordinate2D(latitude: locationCoords[2].latitude, longitude: locationCoords[2].longitude)),
    MyStationItem(coordinate: CLLocationCoordinate2D(latitude: locationCoords[3].latitude, longitude: locationCoords[3].longitude)),
    MyStationItem(coordinate: CLLocationCoordinate2D(latitude: locationCoords[4].latitude, longitude: locationCoords[4].longitude)),
    MyStationItem(coordinate: CLLocationCoordinate2D(latitude: locationCoords[5].latitude, longitude: locationCoords[5].longitude)),
]
