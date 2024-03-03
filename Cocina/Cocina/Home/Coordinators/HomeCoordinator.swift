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
    
    func showProfile() {
        let profileViewController = ProfileViewController()
        profileViewController.coordinator = self
        navigationController.pushViewController(profileViewController, animated: true)
    }
    
    func showEditProfile() {
        let editProfileViewController = EditProfileViewController()
        navigationController.pushViewController(editProfileViewController, animated: true)
    }
    
    func showSettings() {
        let settingsViewController = SettingsViewController()
        settingsViewController.coordinator = self
        navigationController.pushViewController(settingsViewController, animated: true)
    }
    
    func showSync() {
        let syncViewController = SyncViewController()
        navigationController.pushViewController(syncViewController, animated: true)
    }
}
