//
//  AppCoordinator.swift
//  Cocina
//
//  Created by Blaine Beltran on 2/2/24.
//

import UIKit
import SwiftUI

/// All coordinators must conform to coordinating
protocol Coordinating {
    
    /// The setup method to call when getting ready to display a flow
    func start()
    var navigationController: UINavigationController { get }
    var childCoordinators: [Coordinating] { get }
}

// Some coordinators will have child coordinators, but not all.
// Add extension to make this an optional conformance
extension Coordinating {
    var childCoordinators: [Coordinating] { [] }
}

class AppCoordinator: Coordinating {
    // Not sure if there is a better way to do this yet
    var window: UIWindow?
    var childCoordinators = [Coordinating]()
    let navigationController: UINavigationController
    let tabBarController = UITabBarController()
    
    // TODO: call start on all child coordinators at once
    
    
    init(window: UIWindow?, navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        setupOnboarding()
    }
    
    private func setTabBarAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = .background.ramenPrimary
        tabBarController.tabBar.standardAppearance = tabBarAppearance
    }
    
    func setupTabs() {
        setTabBarAppearance()
        setupHome()
        setupExplore()
        setupSearch()
        setupPlan()
        setupGroceries()
        
        guard let windowScene = (window?.windowScene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    
    private func setupOnboarding() {
        let onboardingCoordinator = OnboardingCoordinator(navigationController: navigationController, parentCoordinator: self)
        childCoordinators.append(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    
    private func setupHome() {
        let tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house.fill"), tag: 0)
        let vc = UIHostingController(rootView: HomeView())
        vc.tabBarItem = tabBarItem
        
        let navigationController = UINavigationController()
        navigationController.tabBarItem = tabBarItem
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        childCoordinators.append(homeCoordinator)
        homeCoordinator.start()
        tabBarController.setViewControllers([navigationController], animated: false)
    }
    
    private func setupExplore() {
        let tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "map.fill"), tag: 1)
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        vc.tabBarItem = tabBarItem
        tabBarController.viewControllers?.append(vc)
    }
    
    private func setupSearch() {
        let tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "magnifyingglass"), tag: 2)
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        vc.tabBarItem = tabBarItem
        tabBarController.viewControllers?.append(vc)
    }
    
    private func setupPlan() {
        let tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "calendar"), tag: 3)
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        vc.tabBarItem = tabBarItem
        tabBarController.viewControllers?.append(vc)
    }
    
    private func setupGroceries() {
        let tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "bag"), tag: 4)
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        vc.tabBarItem = tabBarItem
        tabBarController.viewControllers?.append(vc)
    }
}
