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
    @Environment(\.dismiss) private var dismiss
    weak var coordinator: OnboardingCoordinator?
    
    var body: some View {
        VStack {
            appIconImage
            Spacer()
            loginButton
            createAccountButton
            skipAuthButton
        }
        .sheet(isPresented: $presentLogin, content: {
            NavigationStack {
                OnboardingLoginScreenView()
            }
        })
        .sheet(isPresented: $presentAccountCreation, content: {
            NavigationStack {
                OnboardingEnterEmailView()
            }
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
        RamenButton(type: .primaryAction, text: "Login") {
            presentLogin.toggle()
        }
    }
    
    private var createAccountButton: some View {
        RamenButton(type: .secondaryAction, text: "Create account") {
            presentAccountCreation.toggle()
        }
    }
    
    #warning("Remove this button before release!!!")
    private var skipAuthButton: some View {
        Button(action: {
            coordinator?.skipAuth()
        }, label: {
            Text("Skip Auth")
                .ramenFont(for: .headingS)
        })
        .frame(maxWidth: 359)
        .frame(height: 50)
        .background(Color.warnings.warningRed)
        .foregroundStyle(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}
