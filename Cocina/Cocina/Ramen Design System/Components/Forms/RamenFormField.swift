//
//  RamenFormField.swift
//  Cocina
//
//  Created by Blaine Beltran on 1/24/24.
//

import SwiftUI

struct RamenFormField: View, Identifiable {
    let id = UUID()
    let headerText: String
    let placeHolderText: String
    let text: Binding<String>
    var isSecureText = false
    var showDivider = true
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(headerText)
                .foregroundStyle(Color.text.primary)
            if isSecureText {
                SecureField("", text: text, prompt: Text(placeHolderText).foregroundStyle(Color.text.secondary))
            } else {
                TextField("", text: text, prompt: Text(placeHolderText).foregroundStyle(Color.text.secondary))
            }
            if showDivider {
                Divider()
                    .frame(height: 1)
                    .overlay(Color.text.tertiary)
                    .padding(.top, 10)
            }
        }
        .ramenFont(for: .bodyS)
    }
}

