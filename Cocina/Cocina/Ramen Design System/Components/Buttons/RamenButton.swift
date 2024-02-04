//
//  RamenButton.swift
//  Cocina
//
//  Created by Blaine Beltran on 2/4/24.
//

import SwiftUI

enum RamenButtonType {
    case primaryAction
    case secondaryAction
}

struct RamenButton: View {
    let type: RamenButtonType
    let text: String
    let buttonTappedAction: () -> ()
    
    init(type: RamenButtonType, text: String, buttonTappedAction: @escaping () -> Void) {
        self.type = type
        self.text = text
        self.buttonTappedAction = buttonTappedAction
    }
    
    var body: some View {
        Button(action: buttonTappedAction, label: {
            Text(text)
                .ramenFont(for: .headingS)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .foregroundStyle(type == .primaryAction ? Color.white : Color.background.ramenPrimary)
                .background(type == .primaryAction ? Color.background.ramenPrimary : Color.clear)
        })
        .frame(maxWidth: UIScreen.main.bounds.width - 40)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

struct RamenNavigatableButton<Label: View, Destination: View>: View {
    let type: RamenButtonType
    let label: () -> Label
    let destination: () -> Destination
    
    init(type: RamenButtonType, @ViewBuilder label: @escaping () -> Label,  @ViewBuilder destination: @escaping () -> Destination ) {
        self.type = type
        self.label = label
        self.destination = destination
    }
    
    var body: some View {
        Button(action: {}, label: {
            NavigationLink {
                destination()
            } label: {
                label()
                    .ramenFont(for: .headingS)
                    .frame(height: 50)
                    .frame(maxWidth: UIScreen.main.bounds.width - 40)
                    .foregroundStyle(type == .primaryAction ? Color.white : Color.background.ramenPrimary)
                    .background(type == .primaryAction ? Color.background.ramenPrimary : Color.clear)
            }
        })
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

#Preview {
    RamenButton(type: .primaryAction, text: "Button", buttonTappedAction: {})
}
