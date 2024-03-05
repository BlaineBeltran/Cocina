//
//  Extensions+UIViewController.swift
//  Cocina
//
//  Created by Andrea Jimenez on 1/31/24.
//

import UIKit

extension UIViewController {
    
    /// The height of the status bar and navigation bar together
    ///
    /// This should be called in viewIsAppearing when the correct geometry is available
    var topbarHeight: CGFloat {
        return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
    
    /// Recursively finds the topmost presented view controller from the given view controller.
    var topMostViewController: UIViewController? {
        return presentedViewController?.topMostViewController ?? self
    }
    
    /// Dismisses the top-most modal view controller if presented.
    static func dismissTopMostModalViewController(within window: UIWindow?, animated: Bool, completion: (() -> Void)? = nil) {
        guard let rootViewController = window?.rootViewController else {
            completion?()
            return
        }
        
        let topMostViewController = rootViewController.topMostViewController
        
        // Only attempt to dismiss if the view controller was presented modally.
        if topMostViewController?.presentingViewController != nil {
            topMostViewController?.dismiss(animated: animated, completion: completion)
        } else {
            completion?()
        }
    }
}
