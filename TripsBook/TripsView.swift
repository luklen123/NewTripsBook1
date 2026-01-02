import SwiftUI
import Combine

struct TripsView: View {
    
    @EnvironmentObject var store: TripsStore
    @State private var showAddTrip = false
    @State private var selectedTab: TripStatus = .planned
  
    // edycja
    @State private var selectedTripForEdit: Trip? = nil
    
    // udostepnianie
    @State private var showShareSheet = false
    @State private var shareText = ""
    
    // prostsze dla kompilatora
    var filteredTrips: [Trip] {
        store.trips.filter { $0.status == selectedTab }
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
       
                Picker("", selection: $selectedTab) {
                    Text("W planie").tag(TripStatus.planned)
                    Text("Zakończone").tag(TripStatus.completed)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                // lista podrozy
                ScrollView {
                    VStack(spacing: 18) {
                        ForEach(filteredTrips) { trip in
                            
                            TripCard(trip: trip)
                                .contextMenu {
                                    Button {
                                        selectedTripForEdit = trip
                                    } label: {
                                        Label("Edytuj", systemImage: "pencil")
                                    }
               
                                    Button(role: .destructive) {
                                        deleteTrip(trip)
                                    } label: {
                                        Label("Usuń", systemImage: "trash")
                                    }
 
                                    Button {
                                        shareText = shareContent(for: trip)
                                        showShareSheet = true
                                    } label: {
                                        Label("Udostępnij", systemImage: "square.and.arrow.up")
                                    }
                                }
                        }
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
            }
            .navigationTitle("Podróże")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddTrip = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.title3.bold())
                            .foregroundColor(.white)
                            .frame(width: 42, height: 42)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .shadow(color: .blue.opacity(0.25), radius: 6)
                    }
                }
            }
            
            .sheet(isPresented: $showAddTrip) {
                AddTripView()
                    .environmentObject(store)
            }
            
            .sheet(item: $selectedTripForEdit) { trip in
                AddTripView(existingTrip: trip)
                    .environmentObject(store)
            }
            .sheet(isPresented: $showShareSheet) {
                ShareSheet(items: [shareText])
            }
        }
    }
}
extension TripsView {
    
    func deleteTrip(_ trip: Trip) {
        if let index = store.trips.firstIndex(where: { $0.id == trip.id }) {
            store.trips.remove(at: index)
            store.saveTrips()
        }
    }
    
    func shareContent(for trip: Trip) -> String {
        let cities = trip.cities.isEmpty
            ? "—"
            : trip.cities.joined(separator: ", ")
        
        return """
        My trip to \(trip.country)
        Cities: \(cities)
        From: \(formatDate(trip.startDate))
        To: \(formatDate(trip.endDate))
        """
    }
    
    func formatDate(_ date: Date) -> String {
        let f = DateFormatter()
        f.dateFormat = "dd.MM.yyyy"
        return f.string(from: date)
    }
}
