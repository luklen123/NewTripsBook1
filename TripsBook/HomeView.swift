import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var store: TripsStore
    @State private var selectedFilter = "Państwa"
    
    let filters = ["Państwa", "Kontynenty", "Miasta"]
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 28) {
                    
                    headerSection
                    
                    statsSection
                    
                    globeCard
                    
                    filterSection
                    
                    filteredTripsSection
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
            }
        }
    }
}

extension HomeView {
    
    // tytul i przycisk +
    var headerSection: some View {
        HStack {
            Text("TripsBook")
                .font(.system(size: 34, weight: .bold, design: .rounded))
            
            Spacer()
            
            Button(action: {}) {
                Image(systemName: "plus")
                    .font(.title3.bold())
                    .foregroundColor(.white)
                    .frame(width: 42, height: 42)
                    .background(Color.blue)
                    .clipShape(Circle())
                    .shadow(color: .blue.opacity(0.2), radius: 5)
            }
        }
    }
    
    // statystyki
    var statsSection: some View {
        HStack(spacing: 16) {
            
            statCard(
                title: "Odwiedzone kraje",
                value: "\(store.countries.filter{$0.visited}.count)"
            )

            
            statCard(
                title: "% świata",
                value: String(format: "%.1f%%",
                              (Double(store.countries.filter{$0.visited}.count) / 195.0) * 100
                             )
            )
        }
    }
    
    func statCard(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(.gray)
            Text(value)
                .font(.system(size: 22, weight: .bold, design: .rounded))
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
        .cornerRadius(18)
    }
    
    // globus
    var globeCard: some View {
        VStack(alignment: .leading, spacing: 14) {
            
            ZStack {
                RoundedRectangle(cornerRadius: 22)
                    .fill(Color.gray.opacity(0.08))
                    .frame(height: 200)
                
                Text("🌍")
                    .font(.system(size: 100))
            }
            
            HStack {
                Spacer()
                
                Button("Powiększ") {}
                    .font(.caption)
                    .padding(.horizontal, 25)
                    .padding(.vertical, 6)
                    .background(Color.blue.opacity(0.15))
                    .cornerRadius(12)
            }
        }
        .padding()
        .background(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
        .cornerRadius(22)
    }
    
    // filtry
    var filterSection: some View {
       Picker("Filtr", selection: $selectedFilter) {
           Text("Państwa").tag("Państwa")
           Text("Kontynenty").tag("Kontynenty")
           Text("Miasta").tag("Miasta")
    }
        .pickerStyle(.segmented)
        .padding(.horizontal)
    }
   
    var filteredTripsSection: some View {
        
        let completed = store.trips.filter { $0.status == .completed }
        
        return VStack(alignment: .leading, spacing: 20) {
            
            Text("Zakończone podróże")
                .font(.system(size: 22, weight: .bold))
                .padding(.leading, 4)
            
            if selectedFilter == "Państwa" {
                
                let grouped = Dictionary(grouping: completed, by: { $0.country })
                
                ForEach(grouped.keys.sorted(), id: \.self) { country in
                    DisclosureGroup(country) {
                        VStack(spacing: 14) {
                            ForEach(grouped[country]!) { trip in
                                TripCard(trip: trip)
                            }
                        }
                        .padding(.top, 6)
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(14)
                }
            }
            else if selectedFilter == "Kontynenty" {
                
                let grouped = Dictionary(grouping: completed) { trip in
                    store.countries.first(where: { $0.name == trip.country })?.continent ?? "Inne"
                }
                
                ForEach(grouped.keys.sorted(), id: \.self) { continent in
                    DisclosureGroup(continent) {
                        VStack(spacing: 14) {
                            ForEach(grouped[continent]!) { trip in
                                TripCard(trip: trip)
                            }
                        }
                        .padding(.top, 6)
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(14)
                }
            }
            
            else if selectedFilter == "Miasta" {
                let allCities = Array(Set(completed.flatMap { $0.cities })).sorted() 
                ForEach(allCities, id: \.self) { city in
                    let tripsForCity = completed.filter { $0.cities.contains(city) }
                    DisclosureGroup(city) {
                        VStack(spacing: 14) {
                            ForEach(tripsForCity) { trip in
                                TripCard(trip: trip)
                            }
                        }
                        .padding(.top, 6)
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(14)
                }
            }
        }
    }
                
                
        }
    


#Preview {
    HomeView().environmentObject(TripsStore())
}
