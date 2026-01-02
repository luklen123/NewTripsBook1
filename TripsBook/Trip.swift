import Foundation
import SwiftUI

struct Trip: Identifiable, Codable {
    let id = UUID()
    
    var country: String           // 
    var cities: [String]          // czy jakos weryfikujemy
    var startDate: Date
    var endDate: Date
    
    var status: TripStatus        
    var notes: String             
    var photos: [String]          // to trzeba na macu bedzie
}

enum TripStatus: String, Codable {
    case planned = "W planie"
    case completed = "Zakończona"
}

