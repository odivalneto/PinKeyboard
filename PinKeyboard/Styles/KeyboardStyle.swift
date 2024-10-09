//
//  KeyboardStyle.swift
//  PinKeyboard
//
//  Created by Odival Neto on 08/10/24.
//


import SwiftUI

struct KeyboardStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 40))
            .bold()
            .fontDesign(.rounded)
            .frame(width: 80, height: 80)
            .background(.regularMaterial, in: .circle)
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
    }
}

struct KeyboardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.buttonStyle(KeyboardStyle())
    }
}
