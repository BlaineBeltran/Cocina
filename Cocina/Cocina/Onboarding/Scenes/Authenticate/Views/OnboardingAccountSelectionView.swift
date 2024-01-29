//
//  OnboardingAccountSelectionView.swift
//  Cocina
//
//  Created by Blaine Beltran on 1/20/24.
//

import SwiftUI

struct OnboardingAccountSelectionView: View {
    @State var presentLogin = false
    @State var presentAccountCreation = false
    
    var body: some View {
        VStack {
            appIconImage
            Spacer()
            loginButton
            createAccountButton
        }
        .sheet(isPresented: $presentLogin, content: {
            OnboardingLoginScreenView()
        })
        .sheet(isPresented: $presentAccountCreation, content: {
            OnboardingEnterEmailView()
        })
    }
}

#Preview("Onboarding account selection") {
    OnboardingAccountSelectionView()
}


extension OnboardingAccountSelectionView {
    private var appIconImage: some View {
        Image(.appIconImageLarge)
            .resizable()
            .scaledToFill()
            .frame(width: 300, height: 300)
            .padding(.top, 50)
    }
    private var loginButton: some View {
        Button(action: {
            presentLogin.toggle()
        }, label: {
            Text("Login")
                .ramenFont(for: .headingS)
        })
        .frame(maxWidth: 359)
        .frame(height: 50)
        .background(Color.background.ramenPrimary)
        .foregroundStyle(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
    
    private var createAccountButton: some View {
        Button(action: {
            presentAccountCreation.toggle()
        }, label: {
            Text("Create account")
                .ramenFont(for: .headingS)
        })
        .frame(maxWidth: 359)
        .frame(height: 50)
        .background(Color.white)
        .foregroundStyle(Color.background.ramenPrimary)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}
