//
//  AuthenticateConfigurator.swift
//  Cocina
//
//  Created by Blaine Beltran on 1/26/24.
//

import SwiftUI


extension OnboardingHostingViewController {
    
    func configure(vc: UIViewController){
        var view = self
        let interactor = AuthenticateInteractor()
        let presenter = AuthenticatePresenter()
        let router  = AuthenticateRouter(presentingViewController: vc)
        interactor.presenter = presenter
        presenter.view = view
    }
}

