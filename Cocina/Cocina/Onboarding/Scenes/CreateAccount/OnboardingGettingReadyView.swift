//
//  OnboardingGettingReadyView.swift
//  Cocina
//
//  Created by Blaine Beltran on 1/25/24.
//

import SwiftUI
import Lottie

struct OnboardingGettingReadyView: View {
    @State var isLoadingData = true
    let playingMode = LottiePlaybackMode.playing(.fromProgress(0, toProgress: 1, loopMode: .loop))
    let pausedMode: LottiePlaybackMode = LottiePlaybackMode.paused
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.background.ramenFormPrimary.ignoresSafeArea()
                VStack(spacing: 30) {
                    appIcon
                    Spacer()
                    VStack {
                        loadingSpinner
                        waitingMessage
                    }
                }
            }
        }
    }
}

#Preview {
    OnboardingGettingReadyView()
}

private extension OnboardingGettingReadyView {
    private var appIcon: some View {
        Image(.appIconTransparentBackground)
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
            .padding(.top, 50)
    }
    
    private var waitingMessage: some View {
       Text("Getting everything ready for you...")
            .ramenFont(for: .bodyM)
            .foregroundStyle(Color.text.secondary)
    }
    
    private var loadingSpinner: some View {
        LottieView(animation: .named("loadingSpinner"))
            .playbackMode(isLoadingData ? playingMode : pausedMode)
            .resizable()
            .frame(width: 150, height: 150)
    }
}

