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
        // This is a possible code smell...look into making this more scaleable and less decoupled later.
        // FIXME: Code smell
        switch destination {
        case .login:
            presentingViewController?.show(UIHostingController(rootView: OnboardingLoginScreenView()), sender: self)
        case .passwordReset:
            presentingViewController?.show(UIHostingController(rootView: OnboardingEnterPasswordView()), sender: self)
        case .passwordConfirmation:
            presentingViewController?.show(UIHostingController(rootView: OnboardingPasswordSentConfirmationScreen()), sender: self)
        }
    }
}
