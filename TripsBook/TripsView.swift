import SwiftUI
import Combine

struct TripsView: View {
    
    @EnvironmentObject var store: TripsStore
    
    @State private var selectedTab: TripStatus = .planned
    
    
    @State private var showAddTrip = false
    
    @State private var filters = TripFilters()
    @State private var showFilters = false
    @State private var isAscendingOrder = true
    
    // edycja
    @State private var selectedTripForEdit: Trip? = nil
    
    // udostepnianie
    @State private var showShareSheet = false
    @State private var shareText = ""
    
    
    
    var availableContinents: [String] {
        let continents = store.countries.map { $0.continent }
        return ["All"] + Array(Set(continents)).sorted()
    }
    
    var availableYears: [Int] {
        let years = store.trips.map {
            Calendar.current.component(.year, from: $0.startDate)
        }
        return Array(Set(years)).sorted()
    }
    
    var activeFiltersCount: Int {
        var count = 0
        if filters.continent != "All" { count += 1 }
        if filters.year != nil { count += 1 }
        return count
    }
    
    
    var filteredTrips: [Trip] {
        store.trips
            .filter { $0.status == selectedTab }
            .filter { trip in
                filters.continent == "All"
                || store.countries.first(where: { $0.name == trip.country })?.continent == filters.continent
            }
            .filter { trip in
                guard let year = filters.year else { return true }
                return Calendar.current.component(.year, from: trip.startDate) == year
            }
            .sorted {
                isAscendingOrder
                ? $0.startDate < $1.startDate
                : $0.startDate > $1.startDate
            }
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                
                TopElement(
                    title: "Podróże",
                    onTapped: {
                        showAddTrip = true
                    }
                )
                
                // STATUS
                Picker("", selection: $selectedTab) {
                    Text("W planie").tag(TripStatus.planned)
                    Text("Zakończone").tag(TripStatus.completed)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                // filtrowanie i sortowanie
                HStack(spacing: 12) {
                    
                    Button {
                        showFilters = true
                    } label: {
                        ZStack(alignment: .topTrailing) {
                            filterButton(label: "Filtruj", icon: "line.3.horizontal.decrease")
                            
                            if activeFiltersCount > 0 {
                                Text("\(activeFiltersCount)")
                                    .font(.caption2.bold())
                                    .foregroundColor(.white)
                                    .padding(5)
                                    .background(Color.red)
                                    .clipShape(Circle())
                                    .offset(x: 8, y: -8)
                            }
                        }
                    }
                    
           
                    Menu {
                        Button("Od najstarszych") {
                            isAscendingOrder = true
                        }
                        Button("Od najnowszych") {
                            isAscendingOrder = false
                        }
                    } label: {
                        filterButton(label: "Sortuj", icon: "arrow.up.arrow.down")
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                ScrollView {
                    VStack(spacing: 18) {
                        ForEach(filteredTrips) { trip in
                            
                            NavigationLink {
                                TripDetailView(trip: trip)
                                    .environmentObject(store)
                            } label: {
                                TripCard(trip: trip)
                            }
                            .buttonStyle(.plain)
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
            .sheet(isPresented: $showAddTrip) {
                AddTripView()
                    .environmentObject(store)
            }
            .sheet(isPresented: $showFilters) {
                TripFiltersView(
                    filters: $filters,
                    availableContinents: availableContinents,
                    availableYears: availableYears
                )
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
    
    func filterButton(label: String, icon: String) -> some View {
        HStack(spacing: 6) {
            Image(systemName: icon)
            Text(label)
                .font(.subheadline.weight(.medium))
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(Color(.systemGray6))
        .cornerRadius(16)
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
        let cities = trip.cities.isEmpty ? "—" : trip.cities.joined(separator: ", ")
        
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
