//
//  stationAlert.swift
//  ErinnerungsApp
//
//  Created by Kathrine Heinzel 875340
//

import Foundation
import UIKit

// Das Alert, dass beim Eingang in den Stationen aufgerufen wird
class StationAlert: UIViewController {
    func alertAnzeigen(_ title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okGeclickt = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okGeclickt)
        self.present(alert, animated: true, completion: nil)
    }
}
