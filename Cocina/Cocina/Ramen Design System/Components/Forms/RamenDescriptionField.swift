//
//  RamenDescriptionField.swift
//  Cocina
//
//  Created by Blaine Beltran on 2/3/24.
//

import SwiftUI

struct RamenDescriptionField: View {
    let id = UUID()
    let headerText: String
    let placeHolderText: String
    let text: Binding<String>
    var showDivider = true
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(headerText)
                .foregroundStyle(Color.text.primary)
            TextField("", text: text, prompt: Text(placeHolderText).foregroundStyle(Color.text.secondary))
                .frame(minHeight: 150)
                .multilineTextAlignment(.leading)
            if showDivider {
                Divider()
                    .frame(height: 1)
                    .overlay(Color.text.tertiary)
            }
        }
        .ramenFont(for: .bodyS)
    }
}

#Preview {
    RamenDescriptionField(headerText: "Description", placeHolderText: "Write a description", text: .constant(""))
}
