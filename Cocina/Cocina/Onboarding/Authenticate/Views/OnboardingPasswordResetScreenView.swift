//
//  OnboardingPasswordResetScreenView.swift
//  Cocina
//
//  Created by Blaine Beltran on 1/22/24.
//

import SwiftUI

struct OnboardingPasswordResetScreenView: View {
    @Binding var email: String
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.background.ramenFormPrimary
                .ignoresSafeArea()
            VStack {
                Text("Reset password")
                    .ramenFont(for: .headingXL)
                    .foregroundStyle(Color.background.ramenPrimary)
                Text("We will send you an email to reset your password.")
                    .ramenFont(for: .bodyM)
                    .foregroundStyle(Color.text.secondary)
                    .multilineTextAlignment(.center)
                    .padding([.trailing, .leading])
                RamenFormSection {
                    emailField
                }
                    .padding(.top, 35)
                sendEmailButton
                    .padding(.top)
                Spacer()
            }
            .padding(.top, 50)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 5) {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                    .ramenFont(for: .bodyM)
                    .foregroundStyle(Color.background.ramenPrimary)
                }
            }
        }
    }
}

#Preview {
    OnboardingPasswordResetScreenView(email: .constant("test@gmail.com"))
}

private extension OnboardingPasswordResetScreenView {
    private var emailField: RamenFormField {
        RamenFormField(headerText: "Email", placeHolderText: "Enter email", text: $email, showDivider: false)
    }
    
    private var sendEmailButton: some View {
        Button(action: {}, label: {
            NavigationLink {
                OnboardingPasswordSentConfirmationScreen()
            } label: {
                Text("Send email")
                    .ramenFont(for: .headingS)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.background.ramenPrimary)
                    .foregroundStyle(.white)
            }
        })
        .frame(maxWidth: 359)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}
