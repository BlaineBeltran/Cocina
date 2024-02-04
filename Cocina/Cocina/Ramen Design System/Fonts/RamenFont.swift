//
//  RamenFont.swift
//  Cocina
//
//  Created by Blaine Beltran on 1/25/24.
//

import Foundation
import SwiftUI

enum RamenTypography {
    
    /// Font used for navigation titles only. Uses .largeTitle and .heavy
    case navigationTitle
    
    /// Font used for larger headings to grab attention. Uses .largeTitle and .bold
    case headingXL
    
    /// Font used for titles. Uses .title1 and .semibold
    case headingL
    
    /// Font used for medium sized titles. Uses .title2 and .semibold
    case headingM
    
    /// Font used for medium sized titles. Uses .title3 and .semibold
    ///
    /// Used for the primary label on cell descriptions
    case headingS
    
    /// Font used for most regular text. Uses .body and .semibold
    case bodyM
    
    /// Font used for footers and supplementary text. Uses .callout and .semibold
    case bodyS
}

// TODO: DRY and add documentation
extension UIFont {
    static func ramenFont(`for`: RamenTypography) -> UIFont {
        
        let fontStyleAndWeight: (style: UIFont.TextStyle, weight: UIFont.Weight)
        switch `for` {
        case .navigationTitle:
            fontStyleAndWeight = (.largeTitle, .heavy)
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
        case .navigationTitle:
            fontStyleAndWeight = (.largeTitle, .heavy)
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
