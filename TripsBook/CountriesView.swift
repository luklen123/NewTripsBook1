import SwiftUI

struct SheetConfig: Identifiable {
    let id = UUID()
    let country: Country?
}

struct CountriesView: View {
    @EnvironmentObject var store: TripsStore
    @State private var searchText = ""
    @State private var choosenContinent = "All"

    @State private var activeSheet: SheetConfig? = nil
    
    var filteredAndSortedCountries: [Country] {
            // 1. Filtrowanie (Kontynent + Szukanie)
            let filtered = store.countries.filter { country in
                let matchesContinent = (choosenContinent == "All" || country.continent == choosenContinent)
                let matchesSearch = searchText.isEmpty || country.name.localizedLowercase.hasPrefix(searchText.localizedLowercase)
                
                return matchesContinent && matchesSearch
            }
            
            // 2. Sortowanie (Alfabetyczne z polskimi znakami)
            return filtered.sorted {
                $0.name.localizedStandardCompare($1.name) == .orderedAscending
            }
    }
    
    
    
    var body: some View {
        NavigationStack {
            TopElement(title: "Kraje", onTapped: {
                activeSheet = SheetConfig(country: nil)
            })
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    TextField("Szukaj kraju...", text: $searchText)
                }
                .padding(10)
                .background(Color(.systemGray6)) // Szare tło paska
                .cornerRadius(20)
                .padding(.horizontal)
                
                HStack {
                    HStack{
                        Text("Kontynent: ")
                            .padding(.leading, 20)
                        
                        Picker("Kontynenty", selection: $choosenContinent) {
                            Text("Wszystkie").tag("All")
                            Text("Afryka").tag("Afryka")
                            Text("Azja").tag("Azja")
                            Text("Europa").tag("Europa")
                            Text("Ameryka Płn.").tag("Ameryka Płn.")
                            Text("Ameryka Płd.").tag("Ameryka Płd")
                            Text("Australia").tag("Australia")
                        }
                        
                        Spacer()
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                    )
                    .cornerRadius(20)
                    .padding(.horizontal, 10)
                }
                ScrollView {
                    VStack(spacing: 5){

                        ForEach(filteredAndSortedCountries) { country in
                            ZStack {
                                NavigationLink(destination: CountryDetailView(country: country)) {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(.white) // Kolor kafelka
                                }
                                .buttonStyle(.plain)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                                )
                                .cornerRadius(20)
                                
                                CountryItem(country: country, onTapped: {
                                    activeSheet = SheetConfig(country: country)
                                })
                            }
                        }
                    }
                }
                .padding(.horizontal, 10)

            }
        }
        .sheet(item: $activeSheet) { config in
            AddTripView(preselectedCountryName: config.country?.name)
        }
    }
}


#Preview {
    CountriesView()
        .environmentObject(TripsStore())
}



