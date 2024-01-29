//
//  RamenFont.swift
//  Cocina
//
//  Created by Blaine Beltran on 1/25/24.
//

import Foundation
import SwiftUI

enum RamenTypography {
    case headingXL
    case headingL
    case headingM
    case headingS
    case bodyM
    case bodyS
}

// TODO: DRY and add documentation
extension UIFont {
    static func ramenFont(`for`: RamenTypography) -> UIFont {
        
        let fontStyleAndWeight: (style: UIFont.TextStyle, weight: UIFont.Weight)
        switch `for` {
        case .headingXL:
            fontStyleAndWeight = (.largeTitle, .bold)
        case .headingL:
            fontStyleAndWeight = (.title1, .semibold)
        case .headingM:
            fontStyleAndWeight = (.title2, .semibold)
        case .headingS:
            fontStyleAndWeight = (.title3, .semibold)
        case .bodyM:
            fontStyleAndWeight = (.body, .semibold)
        case .bodyS:
            fontStyleAndWeight = (.callout, .semibold)
        }
        
        guard let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: fontStyleAndWeight.style).withDesign(.rounded) else {
            return UIFont.preferredFont(forTextStyle: fontStyleAndWeight.style)
        }
        let size = descriptor.pointSize
        let traits = [UIFontDescriptor.TraitKey.weight: fontStyleAndWeight.weight]
        let weightedDescriptor = descriptor.addingAttributes([.traits: traits])
        let font = UIFont(descriptor: weightedDescriptor, size: size)
        let scalableFont = UIFontMetrics(forTextStyle: fontStyleAndWeight.style).scaledFont(for: font)
        return scalableFont
    }
}

struct RamenFont: ViewModifier {
    let style: RamenTypography
    
    func body(content: Content) -> some View {
        let fontStyleAndWeight: (style: Font, weight: Font.Weight)
        switch style {
        case .headingXL:
            fontStyleAndWeight = (.largeTitle, .bold)
        case .headingL:
            fontStyleAndWeight = (.title, .semibold)
        case .headingM:
            fontStyleAndWeight = (.title2, .semibold)
        case .headingS:
            fontStyleAndWeight = (.title3, .semibold)
        case .bodyM:
            fontStyleAndWeight = (.body, .semibold)
        case .bodyS:
            fontStyleAndWeight = (.callout, .semibold)
        }
        
        return content
            .font(fontStyleAndWeight.style)
            .fontWeight(fontStyleAndWeight.weight)
            .fontDesign(.rounded)
    }
}

extension View {
    func ramenFont(for: RamenTypography) -> some View {
        modifier(RamenFont(style: `for`))
    }
}
