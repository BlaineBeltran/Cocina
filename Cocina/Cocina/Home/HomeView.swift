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
            HStack {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(height: 85)
                    .foregroundStyle(Color.text.tertiary)
                    .overlay {
                        Label("New recipe", systemImage: "square.and.pencil")
                    }
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(height: 85)
                    .foregroundStyle(Color.text.tertiary)
                    .overlay {
                        Label("Settings", systemImage: "camera.viewfinder")
                    }
                    .onTapGesture {
                        moreSheetIsPresented.toggle()
                        coordinator?.showProfile()
                    }
            }
            .padding([.top])
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
        return { }
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
