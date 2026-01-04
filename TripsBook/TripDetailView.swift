import SwiftUI

struct TripDetailView: View {
    
    @EnvironmentObject var store: TripsStore
    let trip: Trip
    
    @State private var showEdit = false
    @State private var showShare = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                headerCard
                detailsSection
                notesSection
                photosPlaceholder
                actionButtons
            }
            .padding()
        }
        .navigationTitle("Podróż")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showEdit) {
            AddTripView(existingTrip: trip)
                .environmentObject(store)
        }
        .sheet(isPresented: $showShare) {
            ShareSheet(items: [shareText])
        }
    }
}


extension TripDetailView {
    
    var headerCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(trip.country)
                        .font(.title2.bold())
                    
                    Text(citiesText)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                statusBadge
            }
        }
        .padding()
        .background(Color.blue.opacity(0.12))
        .cornerRadius(18)
    }
}

extension TripDetailView {
    
    var statusBadge: some View {
        Text(trip.status == .planned ? "W planie" : "Zakończona")
            .font(.caption.bold())
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(
                trip.status == .planned
                ? Color.orange.opacity(0.2)
                : Color.green.opacity(0.2)
            )
            .foregroundColor(
                trip.status == .planned
                ? .orange
                : .green
            )
            .cornerRadius(12)
    }
}


extension TripDetailView {
    
    var detailsSection: some View {
        VStack(spacing: 12) {
            
            detailRow(
                title: "Daty",
                value: dateRange
            )
            
            detailRow(
                title: "Czas trwania",
                value: durationText
            )
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(16)
    }
    
    func detailRow(title: String, value: String) -> some View {
        HStack {
            Text(title)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Text(value)
                .fontWeight(.medium)
        }
    }
}


extension TripDetailView {
    
    var notesSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Notatki")
                .font(.headline)
            
            Text(trip.notes.isEmpty ? "Brak notatek" : trip.notes)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

extension TripDetailView {
    
    var photosPlaceholder: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Zdjęcia")
                .font(.headline)
            
            HStack(spacing: 12) {
                Image(systemName: "photo.on.rectangle")
                    .font(.system(size: 28))
                    .foregroundColor(.blue.opacity(0.6))
                
                Text("Miejsce na zdjęcia z podróży.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.gray.opacity(0.08))
            .cornerRadius(14)
        }
    }
}


extension TripDetailView {
    
    var actionButtons: some View {
        HStack(spacing: 12) {
            
            Button {
                showEdit = true
            } label: {
                Text("Edytuj")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                showShare = true
            } label: {
                Text("Udostępnij")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
        }
        .padding(.top)
    }
}


extension TripDetailView {
    
    var citiesText: String {
        trip.cities.isEmpty
        ? "—"
        : trip.cities.joined(separator: " • ")
    }
    
    var dateRange: String {
        "\(formatDate(trip.startDate)) – \(formatDate(trip.endDate))"
    }
    
    var durationText: String {
        let days = Calendar.current.dateComponents(
            [.day],
            from: trip.startDate,
            to: trip.endDate
        ).day ?? 0
        
        return "\(max(days, 1)) dni"
    }
    
    var shareText: String {
        """
        Podróż: \(trip.country)
        Miasta: \(citiesText)
        Daty: \(dateRange)
        """
    }
    
    func formatDate(_ date: Date) -> String {
        let f = DateFormatter()
        f.dateFormat = "dd.MM.yyyy"
        return f.string(from: date)
    }
}

#Preview {
    TripDetailView(
        trip: Trip(
            country: "Japonia",
            cities: ["Tokio", "Kioto", "Nara"],
            startDate: Date(),
            endDate: Calendar.current.date(byAdding: .day, value: 10, to: Date())!,
            status: .planned,
            notes: "Wycieczka do Tokio na 2 dni, do Kioto na 5 dni.",
            photos: []
        )
    )
    .environmentObject(TripsStore())
}
