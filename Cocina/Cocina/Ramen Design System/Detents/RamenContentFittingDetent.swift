//
//  RamenContentFittingDetent.swift
//  Cocina
//
//  Created by Blaine Beltran on 2/4/24.
//

import SwiftUI

struct RamenContentFittingDetent: CustomPresentationDetent {
    static func height(in context: Context) -> CGFloat? {
        return max(50, context.maxDetentValue * 0.1)
    }
}
