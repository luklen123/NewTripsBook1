//
//  CountryItem.swift
//  TripsBook
//
//  Created by Łukasz Lenart on 01/01/2026.
//


import SwiftUI

struct CountryItem: View {
    @EnvironmentObject var store: TripsStore
    let country : Country
    var onTapped: () -> Void
    
    var currentStyle: (title: String, background: Color, text: Color) {
        if country.visited {
            // Zwracamy paczkę dla odwiedzonego
            return ("Odwiedzony", .green, .white)
        } else {
            // Zwracamy paczkę dla nieodwiedzonego
            if store.trips.contains(where: { $0.country == country.name }) {
                return ("W planie", .orange, .white)
            }
            return ("+ Do planu", .blue, .white)
        }
    }
    

    var body: some View {
        HStack{
            Text(country.flag)
                .font(.largeTitle)
                .padding(.leading, 10)
            
            Text(country.name)
                .font(.headline)
                .padding(.leading, 5)
            
            Spacer()
            
            HStack {
                Button {
                    onTapped()
                } label: {
                    Text(currentStyle.title)
                        .foregroundStyle(currentStyle.text)
                        .padding(9)
                        .background {
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .fill(currentStyle.background)
                        }
                }

            }
            .padding(.trailing, 10)

        }
        .padding(10)
        
    }
}


