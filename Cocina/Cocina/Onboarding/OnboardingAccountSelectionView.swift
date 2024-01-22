//
//  OnboardingAccountSelectionView.swift
//  Cocina
//
//  Created by Blaine Beltran on 1/20/24.
//

import SwiftUI

struct OnboardingAccountSelectionView: View {
    var body: some View {
        VStack {
            appIconImage
            Spacer()
            loginButton
            createAccountButton
        }
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
    
    private var createAccountButton: some View {
        Button(action: {}, label: {
            Text("Create account")
                .font(.title3)
                .fontWeight(.semibold)
        })
        .frame(maxWidth: 359)
        .frame(height: 50)
        .background(Color.white)
        .foregroundStyle(Color.background.ramenPrimary)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}
