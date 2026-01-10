//
//  Calendar.swift
//  TripsBook
//
//  Created by Łukasz Lenart on 08/01/2026.
//

import SwiftUI
import UIKit // Niezbędne dla UIBezierPath


struct CalendarEvent: Identifiable {
    let id : UUID
    let title: String
    let start: Date
    let end: Date
    let color: Color
}


struct SafeCalendarView: View {
    
    @EnvironmentObject var store: TripsStore
    @State var currentMonth: Date // aktualny miesiąc
    @State private var addTripRoute: AddTripRoute? = nil
    private let calendar = Calendar(identifier: .iso8601)
    
    var events: [CalendarEvent] { // poodróże do wyświetlenia
        let colors: [Color] = [.red, .blue, .green, .orange, .purple, .pink, .yellow]
        return store.trips.enumerated().map { index, trip in
            CalendarEvent(
                id: trip.id,
                title: trip.country,
                start: trip.startDate,
                end: trip.endDate,
                color: colors[index % colors.count]
            )
        }
        .sorted { $0.start < $1.start }
    }
    
    var currentMonthTrips: [Trip] {
        let start = calendar.date(from: calendar.dateComponents([.year, .month], from: currentMonth))!
        let nextMonth = calendar.date(byAdding: .month, value: 1, to: start)!
        
        return store.trips
            .filter { $0.startDate < nextMonth && $0.endDate >= start }
            .sorted { $0.startDate < $1.startDate}
    }
    
    private var days: [Date] { // dni do wyświetlenia
        
        guard let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: currentMonth)), // obliczenie początku miesiąca
              let range = calendar.range(of: .day, in: .month, for: startOfMonth) else {
            return [] // lista dni w obecnym miesiacu
        }
        
        let weekdayOfFirst = calendar.component(.weekday, from: startOfMonth) // dzień tygodnia pierwszego dnia miesiąca
        let offsetDays = (weekdayOfFirst - calendar.firstWeekday + 7) % 7 // liczba wyświetlonych dni z poprzedniego miesiąca
        
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
        NavigationStack {
            
            VStack(spacing: 0) {
                TopElement(title: "Kalendarz", onTapped: {
                    addTripRoute = .new
                })
                ScrollView {
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
                    VStack {
                        if currentMonthTrips.isEmpty {
                            Text("Brak podróży w tym miesiącu.")
                                .padding()
                        } else {
                            Text("Podróże w tym miesiącu:")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                                .padding(.horizontal)
                            ForEach(currentMonthTrips) { trip in
                                NavigationLink {
                                    TripDetailView(trip: trip)
                                        .environmentObject(store)
                                } label: {
                                    TripCard(trip: trip)
                                        .padding(.horizontal)
                                }
                                .buttonStyle(.plain)
                            }
                            
                        }
                        
                    }
                    .padding(.bottom)
                }
            }
        }
        .sheet(item: $addTripRoute) { route in
            AddTripView()
                .environmentObject(store)
        }
    }
}


struct DayCell: View {
    let date: Date // dzień
    let events: [CalendarEvent] // eventy
    let currentMonth: Date // obecnie wyświetlany miesiąc
    
    private let calendar = Calendar(identifier: .iso8601)
    
    var body: some View {
        let isCurrentMonth = calendar.isDate(date, equalTo: currentMonth, toGranularity: .month)
        
        ZStack(alignment: .top) {
            Rectangle() // tło
                .fill(Color.white)
                .frame(height: 95)
                .border(Color.gray.opacity(0.1))
            
            VStack(spacing: 2) { // nakładanie pasków eventów
                Spacer().frame(height: 25)
                
                let daysEvents = events.filter { isDateInEvent(date, event: $0) } // wybranie eventów, które są dziś
    
                ForEach(Array(daysEvents.prefix(2))) { event in // rysowanie kresek
                    EventBarView(event: event, date: date)
                }
                
                if daysEvents.count > 2 { // jeśli więcej eventów wyświetlenie informacji o tym
                    Text("+\(daysEvents.count - 2) więcej")
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            
            Text("\(calendar.component(.day, from: date))") // wyświetlenie numeru dnia
                .font(.system(size: 14))
                .foregroundColor(isCurrentMonth ? .primary : .gray.opacity(0.5))
                .padding(5)
                .frame(maxWidth: .infinity, alignment: .topLeading)
        }
    }
    
    private func isDateInEvent(_ date: Date, event: CalendarEvent) -> Bool { // sprawdzenie czy event jest dzis
        let startDay = calendar.startOfDay(for: event.start)
        let endDay = calendar.startOfDay(for: event.end)
        let checkDay = calendar.startOfDay(for: date)
        
        return checkDay >= startDay && checkDay <= endDay
    }
}

struct EventBarView: View {
    let event: CalendarEvent
    let date: Date
    private let calendar = Calendar(identifier: .iso8601)
    
    var body: some View {
        let isStart = calendar.isDate(date, inSameDayAs: event.start)
        let isEnd = calendar.isDate(date, inSameDayAs: event.end)
        let bweekday = calendar.component(.weekday, from: date)
        let weekday = bweekday == 1 ? 7 : bweekday - 1
        
        let roundLeft = isStart || weekday == 1 // Poniedziałek
        let roundRight = isEnd || weekday == 7 // Niedziela
        
        var corners: UIRectCorner = []
        if roundLeft { corners.insert([.topLeft, .bottomLeft]) }
        if roundRight { corners.insert([.topRight, .bottomRight]) }
        
        return Text(isStart || weekday == 1 ? event.title : " ") // zwrocenie widoku
            .font(.caption2)
            .lineLimit(1)
            .padding(.horizontal, 4)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(event.color)
            .foregroundColor(.white)
            .clipShape(RoundedCornerShape(radius: 10, corners: corners))
            .padding(.leading, roundLeft ? 2 : 0)
            .padding(.trailing, roundRight ? 2 : 0)
    }
}

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

#Preview {
    SafeCalendarView(currentMonth: Date())
        .environmentObject(TripsStore())
}
