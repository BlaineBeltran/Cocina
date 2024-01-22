//
//  ViewController.swift
//  Cocina
//
//  Created by Blaine Beltran on 1/19/24.
//

import SwiftUI
import UIKit

class ViewController: UIViewController {
    
    // leaving this to test SwiftUI views
    let hostingController = UIHostingController(rootView: OnboardingLoginScreenView())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        
        hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        hostingController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }


}

