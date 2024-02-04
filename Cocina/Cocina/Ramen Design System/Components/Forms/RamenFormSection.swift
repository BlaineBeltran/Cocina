//
//  RamenFormSection.swift
//  Cocina
//
//  Created by Blaine Beltran on 1/24/24.
//

import SwiftUI

struct RamenFormSection: View {
    let fields: [RamenFormField]
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(fields) { field in
                field
            }
        }
        .padding([.leading, .trailing, .top], 20)
        .padding(.bottom, 15)
        .background {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .foregroundStyle(.white)
                .overlay(alignment: .top) {
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.text.tertiary, lineWidth: 1)
              
            }
        }
        .padding([.leading, .trailing], 20)
    }
}
