//
//  OnboardingPasswordSentConfirmationScreen.swift
//  Cocina
//
//  Created by Blaine Beltran on 1/23/24.
//

import Lottie
import SwiftUI

struct OnboardingPasswordSentConfirmationScreen: View {
    @State var isCheckAnimating = false
    let playingMode = LottiePlaybackMode.playing(.fromProgress(0, toProgress: 1, loopMode: .playOnce))
    let pausedMode: LottiePlaybackMode = LottiePlaybackMode.paused
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.background.ramenFormPrimary
                    .ignoresSafeArea()
                VStack {
                    Text("Confirmation sent!")
                        .ramenFont(for: .headingXL)
                        .foregroundStyle(Color.background.ramenPrimary)
                    Text("Be sure to check your spam folder")
                        .ramenFont(for: .bodyM)
                        .foregroundStyle(Color.text.secondary)
                        .multilineTextAlignment(.center)
                        .padding([.trailing, .leading])
                    animatedCheck
                    backToLoginButton(parentSize: proxy.size.width)
                        .padding(.top)
                    Spacer()
                }
                .padding(.top, 50)
            }
        }
        .onAppear {
            isCheckAnimating.toggle()
        }
    }
}

#Preview {
    OnboardingPasswordSentConfirmationScreen()
}

private extension OnboardingPasswordSentConfirmationScreen {
    private var animatedCheck: some View {
        LottieView(animation: .named("check"))
            .playbackMode(isCheckAnimating ? playingMode : pausedMode)
            .resizable()
            .frame(width: 150, height: 150)
    }
    
    private func backToLoginButton(parentSize: CGFloat) -> some View {
        Button(action: {}, label: {
            Text("Back to login")
                .ramenFont(for: .headingS)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(Color.background.ramenPrimary)
                .foregroundStyle(.white)
        })
        .frame(maxWidth: parentSize - 40)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}
