import SwiftUI
struct TripCard: View {
    
    let trip: Trip
    @EnvironmentObject var store: TripsStore   
    
    var flag: String {
        store.countries.first(where: { $0.name == trip.country })?.flag ?? "🌍"
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            HStack {
                Text(flag)
                    .font(.system(size: 38))
                
                Text(trip.country)
                    .font(.system(size: 22, weight: .semibold))
                
                Spacer()
            }
            
            if !trip.cities.isEmpty {
                Text(trip.cities.joined(separator: ", "))
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            HStack {
                Text(formatDate(trip.startDate))
                Text("—")
                Text(formatDate(trip.endDate))
            }
            .font(.footnote)
            .foregroundColor(.gray)
        }
        .padding()
        .background(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.03), radius: 3, y: 2)
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.string(from: date)
    }
}
