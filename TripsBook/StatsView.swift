import SwiftUI
import Charts

struct StatsView: View {
    
    @EnvironmentObject var store: TripsStore
    @State private var showAddTrip = false

    @State private var selectedStartYear: Int?
    @State private var selectedEndYear: Int =
    Calendar.current.component(.year, from: Date())
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
       
                TopElement(
                    title: "Statystyki",
                    onTapped: { showAddTrip = true }
                )
                
                ScrollView {
                    VStack(spacing: 14) {
                        
                        rangePickerSection
                        
                        statsSummarySection
                        
                        yearlyCountriesChart
                        
                        continentsDonutChart
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
            }
            .onAppear {
                if selectedStartYear == nil {
                    selectedStartYear = defaultStartYear
                }
            }
            .sheet(isPresented: $showAddTrip) {
                AddTripView()
                    .environmentObject(store)
            }
        }
    }
}


extension StatsView {
    
    var rangePickerSection: some View {
        HStack(spacing: 8) {
            
            Text("Zakres:")
                .font(.footnote)
                .foregroundColor(.secondary)
            
            Menu {
                ForEach(availableYears, id: \.self) { year in
                    Button(String(year)) {
                        selectedStartYear = year
                        if selectedEndYear < year {
                            selectedEndYear = year
                        }
                    }
                }
            } label: {
                Text(String(selectedStartYear ?? defaultStartYear))
                    .font(.footnote.bold())
            }
            
            Text("—")
                .font(.footnote)
                .foregroundColor(.secondary)
            
            Menu {
                ForEach(
                    availableYears.filter {
                        $0 >= (selectedStartYear ?? defaultStartYear)
                    },
                    id: \.self
                ) { year in
                    Button(String(year)) {
                        selectedEndYear = year
                    }
                }
            } label: {
                Text(String(selectedEndYear))
                    .font(.footnote.bold())
            }
            
            Spacer()
        }
    }
}


extension StatsView {
    
    var statsSummarySection: some View {
        VStack(alignment: .leading, spacing: 14) {
            
            HStack(spacing: 14) {
                statCard(
                    title: "Dni w podróży",
                    value: "\(totalDays)"
                )
                statCard(
                    title: "Śr. długość wyprawy",
                    value: String(format: "%.1f d", averageTripLength)
                )
            }
            
            LazyVGrid(
                columns: [
                    GridItem(.flexible(), spacing: 14),
                    GridItem(.flexible(), spacing: 14)
                ],
                spacing: 14
            ) {
                statCard(
                    title: "Odwiedzone kraje",
                    value: "\(visitedCountriesCount)"
                )
                
                statCard(
                    title: "Najczęstszy kontynent",
                    value: mostVisitedContinent ?? "—"
                )
            }
            statCard(
                title: "Najdłuższa podróż",
                value: longestTripDescription
            )
        }
    }
    
    func statCard(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text(value)
                .font(.system(size: 26, weight: .bold, design: .rounded))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.gray.opacity(0.15))
        )
        .cornerRadius(18)
    }
}

extension StatsView {
    
    var yearlyCountriesChart: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text("Kraje odwiedzone / rok")
                .font(.headline)
            
            if yearlyCountryData.isEmpty {
                Text("Brak danych w wybranym zakresie.")
                    .foregroundColor(.secondary)
                    .frame(height: 180)
                    .frame(maxWidth: .infinity)
            } else {
                Chart(yearlyCountryData) { item in
                    BarMark(
                        x: .value("Rok", item.yearLabel),
                        y: .value("Kraje", item.count)
                    )
                    .foregroundStyle(.blue)
                    .cornerRadius(6)
                }
                .frame(height: 200)
            }
        }
        .padding()
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(Color.gray.opacity(0.15))
        )
        .cornerRadius(22)
    }
}


extension StatsView {
    
    var continentsDonutChart: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text("Udział kontynentów")
                .font(.headline)
            
            Chart(continentsData) { item in
                SectorMark(
                    angle: .value("Ilość", item.count),
                    innerRadius: .ratio(0.6)
                )
                .foregroundStyle(by: .value("Kontynent", item.continent))
                .annotation(position: .overlay) {
                    if totalContinentsCount > 0 {
                        let percent =
                        Double(item.count) /
                        Double(totalContinentsCount) * 100
                        
                        Text("\(Int(percent))%")
                            .font(.caption.bold())
                            .foregroundColor(.white)
                            .shadow(radius: 2)
                    }
                }
            }
            .frame(height: 240)
        }
        .padding()
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(Color.gray.opacity(0.15))
        )
        .cornerRadius(22)
    }
}

extension StatsView {
    
    var availableYears: [Int] {
        let years = store.trips.map {
            Calendar.current.component(.year, from: $0.endDate)
        }
        let current = Calendar.current.component(.year, from: Date())
        return Array(Set(years + [current])).sorted()
    }
    
    var defaultStartYear: Int {
        availableYears.min() ?? currentYear
    }
    
    var currentYear: Int {
        Calendar.current.component(.year, from: Date())
    }
    
    var filteredCompletedTrips: [Trip] {
        store.trips.filter { trip in
            guard trip.status == .completed else { return false }
            let year = Calendar.current.component(.year, from: trip.endDate)
            return year >= (selectedStartYear ?? defaultStartYear)
            && year <= selectedEndYear
        }
    }
    
    var visitedCountriesCount: Int {
        Set(filteredCompletedTrips.map { $0.country }).count
    }
    
    var totalDays: Int {
        filteredCompletedTrips.reduce(0) { $0 + tripDuration($1) }
    }
    
    var averageTripLength: Double {
        guard !filteredCompletedTrips.isEmpty else { return 0 }
        return Double(totalDays) / Double(filteredCompletedTrips.count)
    }
    
    var mostVisitedContinent: String? {
        let continents = filteredCompletedTrips.compactMap { trip in
            store.countries.first(where: { $0.name == trip.country })?.continent
        }
        
        return Dictionary(grouping: continents, by: { $0 })
            .max(by: { $0.value.count < $1.value.count })?
            .key
    }
    
    var longestTripDescription: String {
        guard let trip = filteredCompletedTrips.max(by: {
            tripDuration($0) < tripDuration($1)
        }) else { return "—" }
        
        return "\(trip.country) – \(tripDuration(trip)) dni"
    }
    
    func tripDuration(_ trip: Trip) -> Int {
        let days = Calendar.current.dateComponents(
            [.day],
            from: trip.startDate,
            to: trip.endDate
        ).day ?? 0
        return max(days, 1)
    }
    
    var yearlyCountryData: [YearlyCountryStat] {
        guard !filteredCompletedTrips.isEmpty else { return [] }
        
        let grouped = Dictionary(grouping: filteredCompletedTrips) {
            Calendar.current.component(.year, from: $0.endDate)
        }
        
        return grouped
            .map { year, trips in
                YearlyCountryStat(
                    yearLabel: String(year),
                    count: Set(trips.map { $0.country }).count
                )
            }
            .sorted { $0.yearLabel < $1.yearLabel }
    }
    
    var continentsData: [ContinentStat] {
        let continents = filteredCompletedTrips.compactMap { trip in
            store.countries.first(where: { $0.name == trip.country })?.continent
        }
        
        let grouped = Dictionary(grouping: continents, by: { $0 })
        
        return grouped.map { continent, values in
            ContinentStat(continent: continent, count: values.count)
        }
    }
    
    var totalContinentsCount: Int {
        continentsData.reduce(0) { $0 + $1.count }
    }
}

struct YearlyCountryStat: Identifiable {
    let id = UUID()
    let yearLabel: String
    let count: Int
}

struct ContinentStat: Identifiable {
    let id = UUID()
    let continent: String
    let count: Int
}

#Preview {
    StatsView()
        .environmentObject(TripsStore())
}
