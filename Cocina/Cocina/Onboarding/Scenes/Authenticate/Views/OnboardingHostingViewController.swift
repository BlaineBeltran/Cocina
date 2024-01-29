//
//  OnboardingHostingViewController.swift
//  Cocina
//
//  Created by Blaine Beltran on 1/28/24.
//

import UIKit
import SwiftUI
import SnapKit

protocol AuthenticateDisplayable {
    func displayAuthentication(viewModel: Authenticate.LogUserIn.ViewModel)
}

extension OnboardingHostingViewController: AuthenticateDisplayable {
    func displayAuthentication(viewModel: Authenticate.LogUserIn.ViewModel) {
        // Still learning if this goes here
    }
}

class OnboardingHostingViewController: UIViewController {    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contentView = OnboardingAccountSelectionView()
        let hostingController = UIHostingController(rootView: contentView)

        // Add your hosting controller as a child, etc.
        addChild(hostingController)
        hostingController.view.frame = view.bounds
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
}
