//
//  Constants.swift
//  BlossomMovie
//
//  Created by stud on 03/11/2025.
//

import Foundation
import SwiftUI

struct Constants {
    static let homeString = "Home"
    static let tripsString = "Trips"
    static let calendarString = "Calendar"
    static let statsString = "Stats"
    static let countriesString = "Countries"
    
    static let homeIconString = "house"
    static let tripsIconString = "airplane"
    static let calendarIconString = "calendar"
    static let statsIconString = "chart.bar"
    static let countriesIconString = "globe"
}

extension Text {
    func addtripButton() -> some View {
        self
            .frame(width: 200, height: 50)
            .foregroundStyle(Color.white) // mozna to zmienic na czarny
            .bold()
            .background {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
            }
    }
}
