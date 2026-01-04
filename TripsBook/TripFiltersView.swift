import SwiftUI

struct TripFiltersView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var filters: TripFilters
    
    let availableContinents: [String]
    let availableYears: [Int]
    
    var body: some View {
        NavigationStack {
            Form {
                
                Section(header: Text("Kontynent")) {
                    Picker("Kontynent", selection: $filters.continent) {
                        ForEach(availableContinents, id: \.self) {
                            Text($0 == "All" ? "Wszystkie" : $0)
                        }
                    }
                }
                
                Section(header: Text("Rok")) {
                    Picker("Rok", selection: Binding(
                        get: { filters.year ?? 0 },
                        set: { filters.year = $0 == 0 ? nil : $0 }
                    )) {
                        Text("Wszystkie").tag(0)
                        ForEach(availableYears, id: \.self) {
                            Text(String($0)).tag($0)
                        }
                    }
                }
                
                Section {
                    Button(role: .destructive) {
                        filters = TripFilters()
                    } label: {
                        HStack {
                            Spacer()
                            Text("Wyczyść filtry")
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Filtry")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Gotowe") {
                        dismiss()
                    }
                }
            }
        }
    }
}
