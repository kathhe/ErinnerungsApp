//
//  ortsButton.swift
//  ErinnerungsApp
//
//  Created by Kathrine Heinzel 875340
//

import Foundation
import SwiftUI

// View der Buttons. Abhängig vom bState wird eine andere Farbe angezeigt.
struct ortsButton: View {
    var label: String
    @State var bState: String
    
    var bgColor: Color {
        var color = Color.red
        
        switch bState {
        case "regular":
            color = Color.red
        case "active":
            color = Color.yellow
        case "clicked":
            color = Color.green
        default:
            color = Color.red
        }
        return color
    }
    var textColor: Color {
        var color = Color.white
        
        switch bState {
        case "regular":
            color = Color.white
        case "active":
            color = Color.black
        case "clicked":
            color = Color.white
        default:
            color = Color.white
        }
        return color
    }

    var body: some View {
        Button( action: { if( self.bState == "active") {self.bState = "clicked"} } ){
            Text( label )
            .frame(width: 175, height: 70, alignment: .center)
            .font(.system(size: 14))
            .background(bgColor)
            .foregroundColor(textColor)
            .clipShape(Rectangle())
        }
    }
}
