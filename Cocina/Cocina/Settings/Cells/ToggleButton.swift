//
//  ToggleButton.swift
//  Cocina
//
//  Created by Andrea Jimenez on 2/12/24.
//

import SwiftUI

struct ToggleButton: View {
    @State private var isOn = false
    
    var body: some View {
        Toggle(isOn: $isOn) { }
        .toggleStyle(SwitchToggleStyle(tint: .pink))
        .labelsHidden()
    }
}

#Preview {
    ToggleButton()
}
