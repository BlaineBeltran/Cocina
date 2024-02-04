//
//  OnboardingEnterEmailView.swift
//  Cocina
//
//  Created by Blaine Beltran on 1/25/24.
//

import SwiftUI

struct OnboardingEnterEmailView: View {
    @State var email: String = ""
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.background.ramenFormPrimary.ignoresSafeArea()
                VStack(spacing: 30) {
                    appIcon
                    RamenFormSection(fields: [enterEmailField])
                    Spacer()
                    HStack {
                        Spacer()
                        nextButton(parentSize: proxy.size.width)
                            .safeAreaPadding(.trailing)
                    }
                }
            }
        }
    }
}

#Preview {
    OnboardingEnterEmailView()
}

private extension OnboardingEnterEmailView {
    private var appIcon: some View {
        Image(.appIconTransparentBackground)
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
            .padding(.top, 50)
    }
    
    private var enterEmailField: RamenFormField {
        RamenFormField(headerText: "Email", placeHolderText: "Enter your email address", text: $email, showDivider: false)
    }
    
    private func nextButton(parentSize: CGFloat) -> some View {
        Button(action: {}, label: {
            NavigationLink {
                OnboardingEnterPasswordView()
            } label: {
                HStack(spacing: 4) {
                    Text("Next")
                    Image(systemName: "arrow.right")
                }
                .ramenFont(for: .headingS)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(Color.background.ramenPrimary)
                .foregroundStyle(.white)
            }
        })
        .frame(width: 100)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}
