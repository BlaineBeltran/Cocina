//
//  OnboardingPasswordResetScreenView.swift
//  Cocina
//
//  Created by Blaine Beltran on 1/22/24.
//

import SwiftUI

struct OnboardingPasswordResetScreenView: View {
    @State private var email = ""
    
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
                RamenFormSection(fields: [emailField])
                    .padding(.top, 35)
                sendEmailButton
                    .padding(.top)
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}

#Preview {
    OnboardingPasswordResetScreenView()
}

private extension OnboardingPasswordResetScreenView {
    private var emailField: RamenFormField {
        RamenFormField(headerText: "Email", placeHolderText: "Enter email", text: $email, showDivider: false)
    }
    
    private var sendEmailButton: some View {
        Button(action: {}, label: {
            Text("Send email")
                .ramenFont(for: .headingS)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(Color.background.ramenPrimary)
                .foregroundStyle(.white)
        })
        .frame(maxWidth: 359)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}
