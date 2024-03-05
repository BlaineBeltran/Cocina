//
//  PasswordRequirement.swift
//  Cocina
//
//  Created by Blaine Beltran on 2/17/24.
//

import SwiftUI

struct PasswordRequirement: View {
    @Binding var isFulfilled: Bool
    let requirement: String
    let circleSize: CGFloat = 18
    
    var body: some View {
        HStack {
            circleView
            requirementText
        }
    }
}

extension PasswordRequirement {
    
    @ViewBuilder
    private var circleView: some View {
        ZStack {
            if !isFulfilled {
                Circle()
                    .stroke(Color.background.ramenPrimary, lineWidth: 2)
                    .frame(width: circleSize, height: circleSize)
            } else {
                Circle()
                    .foregroundStyle(.green)
                    .frame(width: circleSize, height: circleSize)
                    .overlay {
                        Image(systemName: "checkmark")
                            .resizable()
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .padding(.all, 5)
                    }
            }
        }
        .transition(.opacity)
        .animation(.easeInOut, value: isFulfilled)

    }
    
    private var requirementText: some View {
        Text(requirement)
            .font(.footnote)
            .fontWeight(.semibold)
    }
}

#Preview {
    PasswordRequirement(isFulfilled: .constant(true), requirement: "Some cool password requirment")
}
