//
//  TopElemeny.swift
//  TripsBook
//
//  Created by Łukasz Lenart on 01/01/2026.
//


import SwiftUI

struct TopElement: View {
    let title: String
    var onTapped: () -> Void
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 34, weight: .bold, design: .rounded))
            
            Spacer()
            
            Button {
                onTapped()
            } label: {
                Image(systemName: "plus")
                    .font(.title3.bold())
                    .foregroundColor(.white)
                    .frame(width: 42, height: 42)
                    .background(Color.blue)
                    .clipShape(Circle())
                    .shadow(color: .blue.opacity(0.2), radius: 5)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 10)
    }
}

#Preview {
    VStack {
        TopElement(title:"Kraje", onTapped: {})
    }
}
