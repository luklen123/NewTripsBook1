import SwiftUI

struct AddTripView: View {
    
    @EnvironmentObject var store: TripsStore
    @Environment(\.dismiss) var dismiss
    var existingTrip: Trip?
    var preselectedCountryName: String? = nil
    @State private var selectedCountry = ""
    @State private var cityInput = ""
    @State private var cities: [String] = []
    
    @State private var startDate = Date()
    @State private var endDate = Date()
    
    @State private var notes = ""
    var isFormValid: Bool {
        !selectedCountry.isEmpty &&
        startDate <= endDate
    }
     init(existingTrip: Trip? = nil, preselectedCountryName: String? = nil) {
        self.existingTrip = existingTrip
        if let trip = existingTrip {
            _selectedCountry = State(initialValue: trip.country)
            _cities = State(initialValue: trip.cities)
            _startDate = State(initialValue: trip.startDate)
            _endDate = State(initialValue: trip.endDate)
            _notes = State(initialValue: trip.notes)
        } else if let countryName = preselectedCountryName {
            _selectedCountry = State(initialValue: countryName)
            
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                
                Section(header: Text("Kraj")) {
                    Picker("Wybierz kraj", selection: $selectedCountry) {
                        ForEach(
                            store.countries
                                .sorted { $0.name.localizedCompare($1.name) == .orderedAscending }
                                .map { $0.name },
                            id: \.self
                        ) { name in
                            Text(name)
                        }
                    }
                }
                
                Section(header: Text("Miasta")) {
                    HStack {
                        TextField("Dodaj miasto", text: $cityInput)
                        Button("Dodaj") {
                            if !cityInput.isEmpty {
                                cities.append(cityInput)
                                cityInput = "" // czy jakos sprawdzamy czy te miasta sa prawdziwe albo podpowiadamy jak wpisze poczatkowe litery
                            }
                        }
                    }
                    
                    ForEach(cities, id: \.self) { city in
                        Text(city)
                    }
                }
                
                Section(header: Text("Daty podróży")) {
                    DatePicker("Start", selection: $startDate, displayedComponents: .date)
                    DatePicker("Koniec", selection: $endDate, displayedComponents: .date) // tu trzeba dodac sprawdza ie czy poczatek nie jest po koncu podrozy
                }
                
                Section(header: Text("Notatki")) {
                    TextEditor(text: $notes)
                        .frame(height: 120)
                }
            }
            .onAppear {
                    if let name = preselectedCountryName {
                        selectedCountry = name
                    }
            }
            
            .navigationTitle(existingTrip == nil ? "Nowa podróż" : "Edytuj podróż")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Zapisz") {
                        saveTrip()
                        dismiss()
                    }.disabled(!isFormValid)
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Anuluj") { dismiss() }
                }
            }
        }
    }
    func saveTrip() {
        
        let today = Calendar.current.startOfDay(for: Date())
        let start = Calendar.current.startOfDay(for: startDate)
        let end = Calendar.current.startOfDay(for: endDate)
        
        let status: TripStatus
        
        if end <= today {
            status = .completed
        } else {
            status = .planned
        } 
        
         if let old = existingTrip {
            if let index = store.trips.firstIndex(where: { $0.id == old.id }) {
                store.trips[index].country = selectedCountry
                store.trips[index].cities = cities
                store.trips[index].startDate = startDate
                store.trips[index].endDate = endDate
                store.trips[index].notes = notes
                store.trips[index].status = status
            }
        } else { 
            let newTrip = Trip(
                country: selectedCountry,
                cities: cities,
                startDate: startDate,
                endDate: endDate,
                status: status,
                notes: notes,
                photos: []
            )
            
            store.trips.append(newTrip)
        }
        store.updateTripStatuses()
        store.updateVisitedCountries()
        store.saveTrips()
    }
    
    
}

#Preview {
    AddTripView().environmentObject(TripsStore())
}
