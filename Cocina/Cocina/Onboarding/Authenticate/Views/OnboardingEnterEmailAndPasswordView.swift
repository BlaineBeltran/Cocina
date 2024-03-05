//
//  OnboardingEnterEmailAndPasswordView.swift
//  Cocina
//
//  Created by Blaine Beltran on 1/21/24.
//

import SwiftUI
import Lottie

struct OnboardingEnterEmailAndPasswordView: View {
    @StateObject var viewModel = CreateAccountViewModel()
    @State var presentGettingReadyScreen = false
    @State var presentForgotPasswordScreen = false
    @State var isContinueButtonDisabled = true
    @State var showInvalidCredentials = false
    @State var isLoading = false
    
    weak var coordinator: OnboardingCoordinator?
    
    var body: some View {
        ZStack {
            Color.background.ramenFormPrimary
                .ignoresSafeArea()
            VStack {
                appIconImage
                VStack(spacing: 15) {
                    emailField
                        .onChange(of: viewModel.email) {
                            updateContinueButton()
                        }
                        .textContentType(.oneTimeCode)
                    passwordField
                        .onChange(of: viewModel.password) {
                            updateContinueButton()
                        }
                }
                .animation(.easeInOut, value: viewModel.emailFieldState)
                Spacer(minLength: 30)
                continueButton
                forgotPasswordButton
                    .padding(.bottom, 20)
                if showInvalidCredentials {
                    inValidCredentialsView
                }
            }
        }
        .navigationDestination(isPresented: $presentForgotPasswordScreen) {
            OnboardingPasswordResetScreenView(email: $viewModel.email)
        }
        .onChange(of: viewModel.isUserSignedIn) { _, newValue in
            if newValue {
                coordinator?.showHome()
            }
        }
    }
}

#Preview {
    OnboardingEnterEmailAndPasswordView()
}

extension OnboardingEnterEmailAndPasswordView {
    private var appIconImage: some View {
        Image(.appIconTransparentBackground)
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100)
            .padding(.top, 50)
    }
    
    private var emailField: RamenFormField {
        RamenFormField(headerText: "Email", placeHolderText: "Enter your email address", fieldState: $viewModel.emailFieldState, inSection: false, text: $viewModel.email, showDivider: false, footerText: viewModel.emailErrorMessage )
    }
    
    private var passwordField: RamenFormField {
        RamenFormField(headerText: "Password", placeHolderText: "Enter your password", fieldState: $viewModel.passwordFieldState, inSection: false, text: $viewModel.password, isSecureText: true, showDivider: false)
    }
    
    private var continueButton: some View {
        RamenButton(type: .primaryAction, isDisabled: $isContinueButtonDisabled) {
            Task {
                let validEmail = viewModel.checkForValidEmail()
                if validEmail {
                    isLoading = true
                    await viewModel.signInUser()
                }
            }
        } label: {
            if !isLoading {
                Text("Continue")
            } else {
                loadingSpinner
            }
        }
    }
    
    // Trying the .lottie file here since it's smaller than JSON
    // Not really sure on any other benefits just yet
    private var loadingSpinner: some View {
        LottieView {
            try await DotLottieFile.named("WhiteLoadingSpinner")
        }
        .looping()
    }
    
    private var forgotPasswordButton: some View {
        RamenButton(type: .secondaryAction, text: "Forgot password?") {
            presentForgotPasswordScreen.toggle()
        }
    }
    
    private func updateContinueButton() {
        isContinueButtonDisabled = viewModel.email.isEmpty || viewModel.password.isEmpty
    }
    
    private var inValidCredentialsView: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .foregroundStyle(.white)
            .opacity(showInvalidCredentials ? 1 : 0)
            .transition(.push(from: .bottom))
            .animation(.easeInOut, value: showInvalidCredentials)
    }
}
