//
//  addtripButton.swift
//  BlossomMovie
//
//  Created by stud on 03/11/2025.
//

import SwiftUI

struct addtripButton: View {
    var body: some View {
        Button {
            
        } label: {
            Label("Add Trip", systemImage: "plus")
                .frame(width: 120, height: 40)
                .foregroundStyle(Color.white) // mozna to zmienic na czarny
                .bold()
                .background {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                }
        }
    }
}

#Preview {
    VStack {
        addtripButton()
    }
}
