//
//  HomeCoordinator.swift
//  Cocina
//
//  Created by Blaine Beltran on 2/4/24.
//

import UIKit
import SwiftUI

class HomeCoordinator: Coordinating {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = UIHostingController(rootView: HomeView(coordinator: self))
        navigationController.pushViewController(homeViewController, animated: false)
    }
    
    func showSettings() {
        let settingsViewController = SettingsViewController()
        navigationController.pushViewController(settingsViewController, animated: true)
    }
}
