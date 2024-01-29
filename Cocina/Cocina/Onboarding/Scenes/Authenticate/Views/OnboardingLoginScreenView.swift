//
//  OnboardingLoginScreenView.swift
//  Cocina
//
//  Created by Blaine Beltran on 1/21/24.
//

import SwiftUI

struct OnboardingLoginScreenView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var interactor: Authenticateable?
    var router: AuthenticateRoutable?

    var body: some View {
        ZStack {
            Color.background.ramenFormPrimary
                .ignoresSafeArea()
            VStack {
                appIconImage
                RamenFormSection(fields: [usernameField, passwordField])
                Spacer()
                loginButton
                forgotPasswordButton
            }
        }
    }
}

#Preview {
    OnboardingLoginScreenView()
}

extension OnboardingLoginScreenView {
    private var appIconImage: some View {
        Image(.appIconTransparentBackground)
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
            .padding(.top, 50)
    }
    
    private var usernameField: RamenFormField {
        RamenFormField(headerText: "Username", placeHolderText: "Enter username", text: $username)
    }
    
    private var passwordField: RamenFormField {
        RamenFormField(headerText: "Password", placeHolderText: "Enter password", text: $password, isSecureText: true, showDivider: false)
    }
    
    private var loginButton: some View {
        Button(action: {}, label: {
            Text("Login")
                .ramenFont(for: .headingS)
        })
        .frame(maxWidth: 359)
        .frame(height: 50)
        .background(Color.background.ramenPrimary)
        .foregroundStyle(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
    
    private var forgotPasswordButton: some View {
        Button(action: {
            router?.navigateTo(destination: .passwordReset)
        }, label: {
            Text("Forgot password?")
                .ramenFont(for: .headingS)
        })
        .frame(maxWidth: 359)
        .frame(height: 50)
        .background(Color.background.ramenFormPrimary)
        .foregroundStyle(Color.background.ramenPrimary)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}
