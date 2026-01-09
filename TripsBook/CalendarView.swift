import SwiftUI
let monthNamesPL = [
    "",
    "Styczeń",
    "Luty",
    "Marzec",
    "Kwiecień",
    "Maj",
    "Czerwiec",
    "Lipiec",
    "Sierpień",
    "Wrzesień",
    "Październik",
    "Listopad",
    "Grudzień"
]
// do zmiany: wyciaganie aktualnej daty i ten mies na ekranie plus wybieranie miesiaca do wyswietlenia zeby przegladac no i najwazniejsze zanzaczenie podrozy i chronologiczne wypisanie pod ale to na macu trzeba podzialac z tym kalendarzem githubowym

struct CalendarView: View {
    
    @EnvironmentObject var store: TripsStore
    @State private var month = 11     
    @State private var year = 2025
    
    var body: some View {
        VStack {
            TopElement(title: "Kalendarz", onTapped: {})
            CalendarContentView()
            
        }
    }
}

extension CalendarView {
    
    
    func monthName(_ month: Int) -> String {
        return monthNamesPL[month]
    }
    
    
    func daysInMonth(_ month: Int, _ year: Int) -> Int {
        let calendar = Calendar.current
        let date = calendar.date(from: DateComponents(year: year, month: month))!
        return calendar.range(of: .day, in: .month, for: date)!.count
    }
    
    
    func weekdayOffset(_ month: Int, _ year: Int) -> Int {
        let calendar = Calendar.current
        let date = calendar.date(from: DateComponents(year: year, month: month, day: 1))!
        let weekday = calendar.component(.weekday, from: date)
        return (weekday == 1 ? 7 : weekday - 1)
    }
    
    
    var calendarGrid: some View {
        let days = daysInMonth(month, year)
        let offset = weekdayOffset(month, year)
        
        return VStack {
            
            
            HStack {
                ForEach(["Pn","Wt","Śr","Cz","Pt","So","Nd"], id: \.self) { day in
                    Text(day)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)
                }
            }
            
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 16) {
                
                
                ForEach(0..<offset-1, id: \.self) { _ in
                    Text("")
                        .frame(height: 36)
                }
                
                
                ForEach(1...days, id: \.self) { day in
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.systemGray6))
                        
                        Text("\(day)")
                            .font(.headline)
                    }
                    .frame(height: 40)
                }
            }
        }
    }
    
    // lista podrozy
    var tripListSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(store.trips) { trip in
                VStack(alignment: .leading, spacing: 4) {
                    Text(trip.country)
                        .font(.headline)
                    Text("\(formatDate(trip.startDate)) — \(formatDate(trip.endDate))")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                )
                .cornerRadius(16)
            }
        }
    }
    
    func formatDate(_ date: Date) -> String {
        let f = DateFormatter()
        f.dateFormat = "dd MMM"
        return f.string(from: date)
    }
}

#Preview {
    CalendarView().environmentObject(TripsStore())
}
