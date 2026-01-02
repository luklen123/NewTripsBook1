import Foundation
// do zmiany zeby pasowalo pod API
struct Country: Identifiable, Codable {
    let id = UUID()
    
    var name: String          
    var continent: String     
    var flag: String          
    var visited: Bool         
}

extension Country {
    // Statyczna "atrapa" do testów
    static let example = Country(
        name: "Japonia",
        continent: "Asia",
        flag: "🇯🇵",
        visited: false
    )
}
