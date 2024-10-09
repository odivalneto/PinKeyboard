//
//  Extensions.swift
//  PinKeyboard
//
//  Created by Odival Neto on 08/10/24.
//

import SwiftUI

extension View {
    public func pinKeyboard() -> some View {
        self.modifier(KeyboardModifier())
    }
}
