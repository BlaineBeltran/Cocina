//
//  OnboardingEnterAccountInfoFormView.swift
//  Cocina
//
//  Created by Blaine Beltran on 1/25/24.
//

import SwiftUI
import RegexBuilder

struct OnboardingEnterAccountInfoFormView: View {
    typealias Const = Constants.Onboarding
    @State var navigateToDestination = false
    @StateObject var viewModel = CreateAccountViewModel()
    @FocusState private var field: AccountInfoField?
    
    var body: some View {
        ZStack {
            Color.background.ramenFormPrimary.ignoresSafeArea()
            VStack {
                appIcon
                VStack(spacing: 20) {
                    enterFirstAndLastNameSection
                    enterEmailSection
                    enterPasswordSection
                }
               passwordRequirements
                Spacer(minLength: 10)
                HStack {
                    Spacer()
                    continueButton
                        .padding([.trailing, .bottom])
                }
                .ignoresSafeArea(.keyboard)
            }
        }
        .navigationDestination(isPresented: $navigateToDestination) {
            OnboardingGettingReadyView()
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button(action: { goToNextField() }) {
                    Text(toolBarItemText)
                        .foregroundStyle(Color.background.ramenPrimary)
                        .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    OnboardingEnterAccountInfoFormView(viewModel: CreateAccountViewModel())
}

private extension OnboardingEnterAccountInfoFormView {
    private var appIcon: some View {
        Image(.appIconTransparentBackground)
            .resizable()
            .scaledToFill()
            .frame(minWidth: 100, maxWidth: 150, minHeight: 100, maxHeight: 150)
            .padding(.top, 50)
            .padding(.bottom, 25)
    }
    
    private var enterFirstAndLastNameSection: some View {
        RamenFormSection {
            firstNameField
                .focused($field, equals: .firstName)
            lastNameField
                .focused($field, equals: .lastName)
        }
    }
    
    private var enterEmailSection: some View {
        RamenFormSection {
            enterEmailField
                .focused($field, equals: .email)
                .textContentType(.oneTimeCode)
        }
    }
    
    private var enterPasswordSection: some View {
        RamenFormSection {
            enterPasswordField
                .focused($field, equals: .password)
        }
    }
    
    private var firstNameField: RamenFormField {
        RamenFormField(headerText: Const.enterFirstNameHeader, placeHolderText: Const.enterFirstPlaceholder, text: $viewModel.firstName)
    }
    
    private var lastNameField: RamenFormField {
        RamenFormField(headerText: Const.enterLastNameHeader, placeHolderText: Const.enterLastPlaceholder, text: $viewModel.lastName, showDivider: false)
    }
    
    private var enterEmailField: RamenFormField {
        RamenFormField(headerText: Const.enterEmailHeader, placeHolderText: Const.enterEmailPlaceholder, text: $viewModel.email, showDivider: false)
    }
    
    private var enterPasswordField: RamenFormField {
        RamenFormField(headerText: Const.enterPasswordHeader, placeHolderText: Const.enterPasswordPlaceholder, text: $viewModel.password, isSecureText: true, showDivider: false)
    }
    
    private var passwordRequirements: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                PasswordRequirement(isFulfilled: $viewModel.passwordContainsAtLeastOneLetter, requirement: "One letter (a-z)")
                PasswordRequirement(isFulfilled: $viewModel.passwordContainsAtLeastOneDigit, requirement: "One number (0-9)")
                Spacer(minLength: 70)
            }
            
            VStack(alignment: .leading) {
                PasswordRequirement(isFulfilled: $viewModel.passwordContainsAtLeastOneSpecialCharacter, requirement: "One special character")
                PasswordRequirement(isFulfilled: $viewModel.passwordIsAtLeast12Characters, requirement: "12 characters minimum")
                Spacer(minLength: 70)
            }
        }
        .frame(maxWidth: .infinity)
        .foregroundStyle(Color.text.secondary)
        .font(.footnote)
        .padding(.horizontal, 25)
        .padding(.top, 10)
        .opacity($viewModel.password.wrappedValue.isEmpty ? 0 : 1)
        .animation(.easeInOut, value: $viewModel.password.wrappedValue.isEmpty)
    }
    
    private var continueButton: some View {
        RamenButton(type: .primaryAction, text: "Continue") {
            Task {
                do {
                    try await AuthenticationManager().onboardNewUser(with: viewModel.email, password: viewModel.password)
                } catch {
                    
                }
            }
            navigateToDestination.toggle()
        }
    }
    
    private var toolBarItemText: String {
        switch field {
        case .password : "Done"
        default : "Next"
        }
    }
    
    private func goToNextField() {
        guard let current = field, field != .password else { return }
        field = AccountInfoField(rawValue: current.rawValue + 1)
    }
    
    enum AccountInfoField: Int, Hashable {
        case firstName
        case lastName
        case email
        case password
    }
}
