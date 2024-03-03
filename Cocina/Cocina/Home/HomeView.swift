//
//  HomeView.swift
//  Cocina
//
//  Created by Blaine Beltran on 2/4/24.
//

import SwiftUI

struct HomeView: View {
    @State var moreSheetIsPresented = false
    weak var coordinator: HomeCoordinator?
    
    var body: some View {
        VStack {
            navigationBar
            Spacer()
        }
        .sheet(isPresented: $moreSheetIsPresented, onDismiss: dismissAction) {
            RamenButton(type: .secondaryAction, text: "Show settings") {
                moreSheetIsPresented.toggle()
            }
            .padding(.top)
            .presentationDetents([.custom(RamenContentFittingDetent.self)])
            .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    HomeView()
}

extension HomeView {
    private var dismissAction: () -> () {
        return { coordinator?.showProfile() }
    }
    
    private var navigationBar: some View {
        HStack {
            Text("Recipes")
                .ramenFont(for: .navigationTitle)
                .foregroundStyle(Color.text.primary)
            Spacer()
            Button(action: {
                moreSheetIsPresented.toggle()
            }, label: {
                Image(systemName: "ellipsis")
            })
            .foregroundStyle(Color.background.ramenPrimary)
        }
        .padding([.horizontal], 20)

    }
}
