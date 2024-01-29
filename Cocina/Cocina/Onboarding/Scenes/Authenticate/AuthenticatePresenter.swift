//
//  AuthenticatePresenter.swift
//  Cocina
//
//  Created by Blaine Beltran on 1/26/24.
//

import Foundation

protocol AuthenticatePresentable {
    func presentAuthentication(response: Authenticate.LogUserIn.Response)
}

class AuthenticatePresenter {
    var view: AuthenticateDisplayable?
}

extension AuthenticatePresenter: AuthenticatePresentable {
    func presentAuthentication(response: Authenticate.LogUserIn.Response) {
        let viewModel = Authenticate.LogUserIn.ViewModel(name: response.user.name)
        view?.displayAuthentication(viewModel: viewModel)
    }
}
