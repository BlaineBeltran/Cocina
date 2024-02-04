//
//  RamenColors.swift
//  Cocina
//
//  Created by Blaine Beltran on 1/21/24.
//

import SwiftUI
import UIKit
import Foundation

extension UIColor {
    enum text {
        static var primary: UIColor { UIColor(named: "textPrimary")! }
        static var secondary: UIColor { UIColor(named: "secondary")! }
        static var tertiary: UIColor { UIColor(named: "tertiary")! }
    }
    
    enum background {
        static var ramenPrimary: UIColor { UIColor(named: "primary")! }
        static var ramenFormPrimary: UIColor { UIColor(named: "formPrimary")! }
    }
    
    enum warnings {
        static var warningRed: UIColor { UIColor(named: "warningRed")! }
    }
}

extension Color {
    enum text {
        static var primary: Color { Color(.text.primary) }
        static var secondary: Color { Color(.text.secondary) }
        static var tertiary: Color { Color(.text.tertiary) }
    }
    
    enum background {
        static var ramenPrimary: Color { Color(.background.ramenPrimary) }
        static var ramenFormPrimary: Color { Color(.background.ramenFormPrimary) }
    }
    
    enum warnings {
        static var warningRed: Color { Color(.warnings.warningRed) }
    }
}
