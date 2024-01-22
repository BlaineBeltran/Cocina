//
//  OnboardingLoginScreenView.swift
//  Cocina
//
//  Created by Blaine Beltran on 1/21/24.
//

import SwiftUI

struct OnboardingLoginScreenView: View {
    @State private var username: String = ""
    var body: some View {
        ZStack {
            Color.background.ramenFormPrimary
                .ignoresSafeArea()
            VStack {
                appIconImage
                usernameAndPassword
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
    
    private var usernameInput: some View {
        VStack(alignment: .leading) {
            Text("Username")
                .foregroundStyle(Color.text.primary)
                .font(.body)
                .fontWeight(.semibold)
            TextField("", text: $username, prompt: Text("Enter username").foregroundStyle(Color.text.secondary))
                .font(.callout)
                .fontWeight(.semibold)
            Divider()
                .frame(height: 1)
                .overlay(Color.text.tertiary)
                .padding(.top, 10)
        }
    }
    
    private var passwordInput: some View {
        VStack(alignment: .leading) {
            Text("Password")
                .foregroundStyle(Color.text.primary)
                .font(.body)
                .fontWeight(.semibold)
            TextField("", text: $username, prompt: Text("Enter pasword").foregroundStyle(Color.text.secondary))
                .font(.callout)
                .fontWeight(.semibold)
        }
    }
    private var usernameAndPassword: some View {
        RoundedRectangle(cornerRadius: 25, style: .continuous)
            .frame(maxWidth: 359)
            .frame(height: 180)
            .foregroundStyle(.white)
            .overlay(alignment: .top) {
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.text.tertiary ,lineWidth: 1)
                VStack(spacing: 20) {
                    usernameInput
                    passwordInput
                    
            }
                .padding([.leading, .trailing], 20)
        }
    }
    
    private var loginButton: some View {
        Button(action: {}, label: {
            Text("Login")
                .font(.title3)
                .fontWeight(.semibold)
        })
        .frame(maxWidth: 359)
        .frame(height: 50)
        .background(Color.background.ramenPrimary)
        .foregroundStyle(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
    
    private var forgotPasswordButton: some View {
        Button(action: {}, label: {
            Text("Forgot password?")
                .font(.callout)
                .fontWeight(.semibold)
        })
        .frame(maxWidth: 359)
        .frame(height: 50)
        .background(Color.background.ramenFormPrimary)
        .foregroundStyle(Color.background.ramenPrimary)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

