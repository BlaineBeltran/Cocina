//
//  OnboardingEnterPasswordView.swift
//  Cocina
//
//  Created by Blaine Beltran on 1/25/24.
//

import SwiftUI

struct OnboardingEnterPasswordView: View {
    @State var password: String = ""
    @State var confirmedPassword: String = ""
    
    var body: some View {
        ZStack {
            Color.background.ramenFormPrimary.ignoresSafeArea()
            VStack(spacing: 30) {
                appIcon
                RamenFormSection(fields: [enterPasswordField, confirmPasswordField])
                Spacer()
                HStack {
                    backToEmailButton
                    Spacer()
                    createAccountButton
                        .safeAreaPadding(.trailing)
                }
            }
        }
    }
}

#Preview {
    OnboardingEnterPasswordView()
}

private extension OnboardingEnterPasswordView {
    private var appIcon: some View {
        Image(.appIconTransparentBackground)
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
            .padding(.top, 50)
    }
    
    private var enterPasswordField: RamenFormField {
        RamenFormField(headerText: "Password", placeHolderText: "Enter a password...", text: $password, isSecureText: true)
    }
    
    private var confirmPasswordField: RamenFormField {
        RamenFormField(headerText: "Confirm password", placeHolderText: "Confirm your password", text: $confirmedPassword, isSecureText: true, showDivider: false)
    }
    
    private var createAccountButton: some View {
        Button(action: {}, label: {
            Text("Create account")
            .padding([.leading, .trailing], 20)
            .ramenFont(for: .headingS)
            .frame(height: 50)
            .background(Color.background.ramenPrimary)
            .foregroundStyle(.white)
        })
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
    
    private var backToEmailButton: some View {
        Button(action: {}, label: {
            Image(systemName: "arrow.left")
            .padding([.leading, .trailing], 20)
            .ramenFont(for: .headingL)
            .frame(height: 50)
            .background(Color.clear)
            .foregroundStyle(Color.background.ramenPrimary)
        })
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}
