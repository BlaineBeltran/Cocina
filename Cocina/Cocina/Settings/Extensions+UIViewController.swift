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
}
