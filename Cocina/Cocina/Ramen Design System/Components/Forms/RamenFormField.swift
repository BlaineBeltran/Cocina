//
//  RamenFormField.swift
//  Cocina
//
//  Created by Blaine Beltran on 1/24/24.
//

import SwiftUI

enum FieldState {
    case neutral
    case negative
}

struct RamenFormField: View {
    private let headerText: String
    private let placeHolderText: String
    private let fieldState: Binding<FieldState>
    private let inSection: Bool
    private let text: Binding<String>
    private var isSecureText: Bool
    private var showDivider: Bool
    private var footerText: String?
    
    @State private var hidePassword = true
    @FocusState private var isFieldFocused
    @FocusState private var isSecureFieldFocused
    
    init(headerText: String, placeHolderText: String, fieldState: Binding<FieldState> = .constant(.neutral), inSection: Bool = true, text: Binding<String>, isSecureText: Bool = false, showDivider: Bool = true, hidePassword: Bool = true, footerText: String? = nil) {
        self.headerText = headerText
        self.placeHolderText = placeHolderText
        self.fieldState = fieldState
        self.inSection = inSection
        self.text = text
        self.isSecureText = isSecureText
        self.showDivider = showDivider
        self.hidePassword = hidePassword
        self.footerText = footerText
    }
    
    // TODO: This will need to get refactored into two separate view later...
    var body: some View {
        if !inSection {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 1) {
                    headerView
                    fieldView
                }
                .padding([.horizontal, .top], 15)
                .padding(.bottom, 15)
                .background {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .foregroundStyle(.white)
                        .overlay(alignment: .top) {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(strokeBorderColor, lineWidth: lineWidth)
                                .animation(.easeInOut(duration: 0.15), value: fieldState.wrappedValue)
                                .animation(.easeInOut(duration: 0.15), value: isFieldFocused)
                      
                    }
                }
                .padding(.horizontal, 20)
                footerView
            }
            .transition(.opacity)
            .animation(.easeInOut, value: fieldState.wrappedValue)
            .ramenFont(for: .bodyS)
            .onTapGesture {
                if isSecureText && hidePassword {
                    isSecureFieldFocused = true
                } else {
                    isFieldFocused = true
                }
            }
        } else {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 1) {
                    headerView
                    fieldView
                    footerView
                }
                if showDivider {
                    Divider()
                        .frame(height: 1)
                        .overlay(Color.text.tertiary)
                }
            }
            .ramenFont(for: .bodyS)
        }
    }
}

extension RamenFormField {
    
    private var headerView: some View {
        Text(headerText)
            .foregroundStyle(textColor)
            .animation(.easeInOut(duration: 0.15), value: fieldState.wrappedValue)
            .ramenFont(for: .bodyM)
    }
    
    @ViewBuilder
    private var fieldView: some View {
        if isSecureText {
            secureTextField
        } else {
            regularTextField
        }
    }
    
    @ViewBuilder
    private var footerView: some View {
        if let footerText {
            Text(footerText)
                .foregroundStyle(textColor)
                .fontWeight(.semibold)
                .font(.footnote)
                .padding(.horizontal, 25)
        }
    }
    
    private var regularTextField: some View {
        TextField("", text: text, prompt: Text(placeHolderText).foregroundStyle(placeholderTextColor))
            .animation(.easeInOut(duration: 0.15), value: fieldState.wrappedValue)
            .frame(height: 30)
            .textInputAutocapitalization(.never)
            .focused($isFieldFocused)
    }
    
    private var secureTextField: some View {
        HStack {
            ZStack {
                SecureField("", text: text, prompt: Text(placeHolderText).foregroundStyle(placeholderTextColor))
                    .opacity(hidePassword ? 1 : 0)
                    .frame(height: 30)
                    .textContentType(.oneTimeCode)
                    .focused($isSecureFieldFocused)
                TextField("", text: text, prompt: Text(placeHolderText).foregroundStyle(placeholderTextColor))
                    .opacity(hidePassword ? 0 : 1)
                    .frame(height: 30)
                    .textContentType(.oneTimeCode)
                    .focused($isFieldFocused)
            }
            hideOrShowPasswordButton
        }
    }
    
    private var hideOrShowPasswordButton: some View {
        Text(hidePassword ? "show" : "hide")
            .onTapGesture {
                hidePassword.toggle()
            }
        .foregroundStyle(Color.background.ramenPrimary)
    }
    
    private var textColor: some ShapeStyle {
        if fieldState.wrappedValue == .neutral { Color.text.primary } else { Color.warnings.warningRed }
    }
    
    private var placeholderTextColor: some ShapeStyle {
        if fieldState.wrappedValue == .neutral { Color.text.secondary } else { Color.warnings.warningRed }
    }
    
    private var strokeBorderColor: some ShapeStyle {
        switch (fieldState.wrappedValue, isFieldFocused || isSecureFieldFocused) {
        case (.neutral, false): Color.text.tertiary
        case (.negative, _): Color.warnings.warningRed
        default: Color.background.ramenPrimary
        }
    }
    
    private var lineWidth: CGFloat {
        switch (isFieldFocused || isSecureFieldFocused, fieldState.wrappedValue) {
        case (true, _): 2
        case (false, .negative): 2
        default: 1
        }
    }
    
}


