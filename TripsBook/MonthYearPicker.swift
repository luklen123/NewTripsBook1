//
//  MonthYearPicker.swift
//  TripsBook
//
//  Created by Łukasz Lenart on 09/01/2026.
//

import SwiftUI

struct ElegantMonthYearPicker: View {
    @State private var selectedIndex = 0
    @State private var showPicker = false

    // Tablica wszystkich kombinacji miesiąc + rok
    private let monthYearOptions: [String] = {
        let months = Calendar.current.monthSymbols
        var options = [String]()
        for year in 2000...2030 {
            for month in months {
                options.append("\(month) \(year)")
            }
        }
        return options
    }()

    var body: some View {
        VStack {
            // Wyświetlany przycisk z aktualnym wyborem
            Button(action: {
                showPicker = true
            }) {
                HStack {
                    Text(monthYearOptions[selectedIndex])
                        .font(.title3)
                        .foregroundColor(.primary)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.2))
                )
            }
            .padding()
        }
        // Sheet z pickerem
        .sheet(isPresented: $showPicker) {
            VStack(spacing: 0) {
                // Nagłówek z przyciskami
                HStack {
                    Button("Anuluj") {
                        showPicker = false
                    }
                    Spacer()
                    Text("Wybierz miesiąc i rok")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Spacer()
                    Button("OK") {
                        showPicker = false
                    }
                }
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                
                Divider()
                
                // Picker
                Picker("", selection: $selectedIndex) {
                    ForEach(0..<monthYearOptions.count, id: \.self) { index in
                        Text(monthYearOptions[index]).tag(index)
                    }
                }
                .pickerStyle(.wheel)
                .background(Color(UIColor.systemBackground))
                .frame(maxHeight: 250)
                
                Spacer()
            }
            .presentationDetents([.height(350)])
            .background(Color(UIColor.systemBackground))
        }
    }
}

#Preview {
    ElegantMonthYearPicker()
}
