//
//  Calendar.swift
//  TripsBook
//
//  Created by Łukasz Lenart on 08/01/2026.
//

import SwiftUI
import UIKit // Niezbędne dla UIBezierPath


struct CalendarEvent: Identifiable {
    let id = UUID()
    let title: String
    let start: Date
    let end: Date
    let color: Color
}


struct SafeCalendarView: View {
    let events: [CalendarEvent] // poodróże do wyświetlenia
    @State var currentMonth: Date // aktualny miesiąc
    
    private var days: [Date] { // dni do wyświetlenia
        let calendar = Calendar(identifier: .iso8601)// ustawienie typu kalendarza
        
        guard let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: currentMonth)), // obliczenie początku miesiąca
              let range = calendar.range(of: .day, in: .month, for: startOfMonth) else {
            return [] // lista dni w obecnym miesiacu
        }
        
        let weekdayOfFirst = calendar.component(.weekday, from: startOfMonth) // dzień tygodnia pierwszego dnia miesiąca
        let offsetDays = weekdayOfFirst - 1 // liczba wyświetlonych dni z poprzedniego miesiąca
        
        var allDays: [Date] = [] // lista wszystkich dni do wyświetlenia
        
        if offsetDays > 0 { // jeśli musimy wyświetlić dni z poprzedniego miesiąca to musimy je dodać
            for i in (1...offsetDays).reversed() {
                if let prevDate = calendar.date(byAdding: .day, value: -i, to: startOfMonth) {
                    allDays.append(prevDate) // dodawanie dnia z poprzedniego miesiąca
                }
            }
        }
        
        for day in range { // dodajemy dni z obecnego miesiąca
            if let date = calendar.date(byAdding: .day, value: day - 1, to: startOfMonth) {
                allDays.append(date)
            }
        }
        
        return allDays
    }

    var body: some View {
        VStack {
            HStack {
                Button { // przycisk do poprzedniego miesiąca
                    currentMonth = Calendar.current.date(byAdding: .month, value: -1, to: currentMonth)!
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }
                
                Spacer()

                Text(currentMonth.formatted(.dateTime.month(.wide).year())) // tekst z obecnym miesiącem i rokiem
                    .font(.title)
                    .bold()

                Spacer()
                
                Button { // przycisk do następnego miesiąca
                    currentMonth = Calendar.current.date(byAdding: .month, value: 1, to: currentMonth)!
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }

            }
            
            HStack { // wiersz dni tygodnia
                ForEach(["Pon", "Wt", "Śr", "Czw", "Pt", "Sob", "Niedz"], id: \.self) { day in
                    Text(day).frame(maxWidth: .infinity).font(.caption).foregroundColor(.gray)
                }
            }

            let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 7) // siatka dni
            
            LazyVGrid(columns: columns, spacing: 0) { // wyświetlanie dni
                ForEach(days, id: \.self) { date in
                    DayCell(date: date, events: events, currentMonth: currentMonth)
                }
            }
        }
        .padding()
    }
}


struct DayCell: View {
    let date: Date
    let events: [CalendarEvent]
    let currentMonth: Date
    
    private let calendar = Calendar.current
    
    var body: some View {
        let isCurrentMonth = calendar.isDate(date, equalTo: currentMonth, toGranularity: .month)
        
        ZStack(alignment: .top) {
            // Tło
            Rectangle()
                .fill(Color.white) // Dla ciemnego trybu użyj Color(.systemBackground)
                .frame(height: 70)
                .border(Color.gray.opacity(0.1))
            
            // Wydarzenia
            VStack(spacing: 2) {
                Spacer().frame(height: 25)
                
                let daysEvents = events.filter { isDateInEvent(date, event: $0) }
                
                // Rzutowanie na Array pomaga kompilatorowi
                ForEach(Array(daysEvents.prefix(3))) { event in
                    EventBarView(event: event, date: date)
                }
                
                if daysEvents.count > 3 {
                    Text("+\(daysEvents.count - 3) więcej")
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            
            // Numer dnia
            Text("\(calendar.component(.day, from: date))")
                .font(.system(size: 14))
                .foregroundColor(isCurrentMonth ? .primary : .gray.opacity(0.5))
                .padding(5)
                .frame(maxWidth: .infinity, alignment: .topLeading)
        }
    }
    
    private func isDateInEvent(_ date: Date, event: CalendarEvent) -> Bool {
        let startDay = calendar.startOfDay(for: event.start)
        let endDay = calendar.startOfDay(for: event.end)
        let checkDay = calendar.startOfDay(for: date)
        
        return checkDay >= startDay && checkDay <= endDay
    }
}

// --- 4. WIDOK PASKA (Naprawiony) ---

struct EventBarView: View {
    let event: CalendarEvent
    let date: Date
    private let calendar = Calendar.current
    
    var body: some View {
        let isStart = calendar.isDate(date, inSameDayAs: event.start)
        let isEnd = calendar.isDate(date, inSameDayAs: event.end)
        let weekday = calendar.component(.weekday, from: date)
        
        let roundLeft = isStart || weekday == 1 // Niedziela
        let roundRight = isEnd || weekday == 7 // Sobota
        
        // Obliczamy rogi tutaj, aby nie męczyć kompilatora wewnątrz ViewBuilder
        var corners: UIRectCorner = []
        if roundLeft { corners.insert([.topLeft, .bottomLeft]) }
        if roundRight { corners.insert([.topRight, .bottomRight]) }
        
        return Text(isStart || weekday == 1 ? event.title : " ")
            .font(.caption2)
            .lineLimit(1)
            .padding(.horizontal, 4)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(event.color)
            .foregroundColor(.white)
            .clipShape(RoundedCornerShape(radius: 4, corners: corners)) // Teraz czysto
            .padding(.leading, roundLeft ? 2 : 0)
            .padding(.trailing, roundRight ? 2 : 0)
    }
}

// --- 5. EXTENSIONS I SHAPES ---

struct RoundedCornerShape: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

// --- 6. GŁÓWNY WIDOK APP ---

struct CalendarContentView: View {
    static var sampleEvents: [CalendarEvent] {
        let today = Date()
        let cal = Calendar.current
        // Bezpieczne tworzenie dat testowych
        let day2 = cal.date(byAdding: .day, value: -20, to: today) ?? today
        let day4 = cal.date(byAdding: .day, value: 4, to: today) ?? today
        let day6 = cal.date(byAdding: .day, value: 6, to: today) ?? today
        let day10 = cal.date(byAdding: .day, value: 10, to: today) ?? today
        let day100 = cal.date(byAdding: .day, value: 100, to: today) ?? today
        
        return [
            
            CalendarEvent(title: "Spotkanie", start: day2, end: day10, color: .red),
            CalendarEvent(title: "Urlop", start: today, end: day4, color: .blue),
            CalendarEvent(title: "Projekt", start: day6, end: day100, color: .green)
        ]
    }

    var body: some View {
        NavigationView {
            ScrollView {
                SafeCalendarView(events: Self.sampleEvents, currentMonth: Date())
            }
        }
    }
}

#Preview {
    CalendarContentView()
}
