import Foundation
import SwiftUI // Jeśli używasz tego w widokach SwiftUI

// MARK: - Modele Danych

struct Info: Codable, Identifiable {
    var id = UUID() // Dodane automatyczne ID dla pętli ForEach
    var name: String
    var description: String
    var imageURL: String
    var wikipediaURL: String
    
    // Customowy init pozwala pominąć podawanie ID przy tworzeniu danych
    init(name: String, description: String, imageURL: String, wikipediaURL: String) {
        self.name = name
        self.description = description
        self.imageURL = imageURL
        self.wikipediaURL = wikipediaURL
    }
}

struct CountryD: Identifiable, Codable {
    let id = UUID()
    
    var name: String
    var capital: String
    var continent: String
    var currency: String
    var flag: String
    var lang: [String]
    var population: Int
    var visited: Bool = false
    var culture: [Info]
    var cities: [Info]
    var nature: [Info]
}

