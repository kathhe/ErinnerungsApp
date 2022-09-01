//
//  ContentView.swift
//  ErinnerungsApp
//
//  Created by Kathrine Heinzel 875340
//

import SwiftUI
import MapKit
import CoreLocation

struct ContentView: View {
    @StateObject var locationEnvironment = LocationEnvironment()
    // Region, die beim Erstaufruf der App angeezeigt wird.
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 52.505802, longitude: 13.332935), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
        VStack {
            // Zeigt die Karte an, $region is eine Bindingvariable (das "$" Zeichen!)
            // .onAppear wird ausgeführt, wenn die App gestartet wird.
            Map(coordinateRegion: $region,
                showsUserLocation: true,
                userTrackingMode: .constant(.follow),
                // Mit Hilfe von MapAnnotation werden die Rechtecke auf der Karte angezeigt.
                annotationItems: stationItems){item in
                MapAnnotation(coordinate: item.coordinate, anchorPoint: CGPoint(x: 0.5, y: 0.5)) {
                    Rectangle()
                        .strokeBorder(Color.purple, lineWidth: 3)
                        .background(Rectangle().foregroundColor(Color.white))
                        .frame(width: 20, height: 20)
                }
            }
                .frame(width: 400, height: 300)
                .onAppear{ locationEnvironment.initPositionService() }
            
            // Die Buttons werden geladen
            VStack(alignment: .center) {
                HStack{
                    ortsButton(label: "Kisok - Zeitung holen", bState: "default")
                    ortsButton(label: "Bäckerei - Brot kaufen", bState: "active")
                }
                HStack{
                    ortsButton(label: "Kaufhaus - Neue Socken", bState: "clicked")
                    ortsButton(label: "Wochenmarkt - Frisches Obst", bState: "default")
                }
                HStack{
                    ortsButton(label: "Penny - Wochenangebote", bState: "default")
                    ortsButton(label: "Park - Enten Füttern", bState: "default")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
