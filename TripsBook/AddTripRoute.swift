//
//  AddTripRoute.swift
//  TripsBook
//
//  Created by Łukasz Lenart on 08/01/2026.
//

import Foundation

enum AddTripRoute: Identifiable {
    case new
    case preselected(country: String)

    var id: String {
        switch self {
        case .new:
            return "new"
        case .preselected(let country):
            return "preselected-\(country)"
        }
    }
}
