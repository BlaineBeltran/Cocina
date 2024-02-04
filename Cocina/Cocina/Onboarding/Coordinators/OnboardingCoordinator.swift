//
//  MainCoordinator.swift
//  Cocina
//
//  Created by Blaine Beltran on 2/2/24.
//

import UIKit
import SwiftUI

class OnboardingCoordinator: Coordinating {
    let navigationController: UINavigationController
    var parentCoordinator: Coordinating?
    
    init(navigationController: UINavigationController, parentCoordinator: Coordinating? = nil) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }
    
    func start() {
        guard parentCoordinator is AppCoordinator else { return }
        let rootViewController = UIHostingController(rootView: OnboardingAccountSelectionView(coordinator: self))
        navigationController.pushViewController(rootViewController, animated: false)
    }
    
    func skipAuth() {
        guard let coordinator = parentCoordinator as? AppCoordinator else { return }
        coordinator.setupTabs()
    }
}
