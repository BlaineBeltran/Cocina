//
//  AuthenticateInteractor.swift
//  Cocina
//
//  Created by Blaine Beltran on 1/26/24.
//

import Foundation

protocol Authenticateable {
    func logUserIn(request: Authenticate.LogUserIn.Request)
}

class AuthenticateInteractor {
    var presenter: AuthenticatePresentable?
}

extension AuthenticateInteractor: Authenticateable {
    func logUserIn(request: Authenticate.LogUserIn.Request) {
        let user = TestUser(name: request.nameEnteredByUser)
        let response = Authenticate.LogUserIn.Response(user: user)
        
    }
}
