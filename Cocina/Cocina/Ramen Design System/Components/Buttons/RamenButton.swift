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

enum RamenDestructiveButtonType {
    case primaryDestructive
    case secondaryDestructive
}

struct RamenButton<Label: View>: View {
    let type: RamenButtonType
    let buttonTappedAction: () -> ()
    let label: () -> Label
    private var isDisabled: Binding<Bool>
    
    init(type: RamenButtonType,
         isDisabled: Binding<Bool> = .constant(false),
         buttonTappedAction: @escaping () -> Void,
         @ViewBuilder label: @escaping () -> Label) {
        self.type = type
        self.isDisabled = isDisabled
        self.buttonTappedAction = buttonTappedAction
        self.label = label
        
    }
    
    var body: some View {
        Button(action: buttonTappedAction, label: {
            label()
                .ramenFont(for: .headingS)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .foregroundStyle(type == .primaryAction ? Color.white : Color.background.ramenPrimary)
                .background(buttonBackgroundColor)
        })
        .frame(maxWidth: .infinity)
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
        .padding(.horizontal, 20)
        .disabled(isDisabled.wrappedValue)
    }
    
    @ViewBuilder
    private var buttonBackgroundColor: some View {
        switch (type, isDisabled.wrappedValue) {
        case (.primaryAction, false):
            Color.background.ramenPrimary
        case (.primaryAction, true):
            Color.background.ramenPrimary
                .opacity(0.5)
        default: Color.clear
        }
    }
}

extension RamenButton where Label == Text {
    init(type: RamenButtonType, text: String, isDisabled: Binding<Bool> = .constant(false), buttonTappedAction: @escaping () -> Void) {
        self.init(type: type, isDisabled: isDisabled, buttonTappedAction: buttonTappedAction) {
            Text(text)
        }
    }
}

struct RamenDestructiveButton: View {
    let type: RamenDestructiveButtonType
    let text: String
    let buttonTappedAction: () -> ()

    init(type: RamenDestructiveButtonType, text: String, buttonTappedAction: @escaping () -> Void) {
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
                .foregroundStyle(type == .primaryDestructive ? Color.white : Color.warnings.warningRed)
                .background(type == .primaryDestructive ? Color.warnings.warningRed : Color.white)
        })
        .frame(maxWidth: .infinity)
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
        .padding(.horizontal, 20)
    }
}

#Preview {
    RamenButton(type: .primaryAction, text: "Button", buttonTappedAction: {})
}
