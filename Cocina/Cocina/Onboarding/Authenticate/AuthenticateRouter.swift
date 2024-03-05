//
//  AuthenticateRouter.swift
//  Cocina
//
//  Created by Blaine Beltran on 1/28/24.
//

import Foundation
import UIKit
import SwiftUI

enum AuthenticateRouteDestination {
    case login
    case passwordReset
    case passwordConfirmation
}

protocol AuthenticateRoutable {
    func navigateTo(destination: AuthenticateRouteDestination)
}

final class AuthenticateRouter: AuthenticateRoutable {
    weak var presentingViewController: UIViewController?
    
    init(presentingViewController: UIViewController) {
        self.presentingViewController = presentingViewController
    }
    
    func navigateTo(destination: AuthenticateRouteDestination) {
    }
}
