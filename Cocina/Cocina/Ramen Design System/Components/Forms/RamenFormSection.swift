//
//  RamenFormSection.swift
//  Cocina
//
//  Created by Blaine Beltran on 1/24/24.
//

import SwiftUI

struct RamenFormSection<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 10) {
            content
        }
        .padding([.horizontal, .top], 20)
        .padding(.bottom, 15)
        .background {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .foregroundStyle(.white)
                .overlay(alignment: .top) {
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.text.tertiary, lineWidth: 1)
              
            }
        }
        .padding(.horizontal, 20)
    }
}
