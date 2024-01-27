//
//  AuthenticateConfigurator.swift
//  Cocina
//
//  Created by Blaine Beltran on 1/26/24.
//

import SwiftUI

extension OnboardingLoginScreenView {
    func configure() {
        var view = self
        let interactor = AuthenticateInteractor()
        let presenter = AuthenticatePresenter()
        
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
    }
}
