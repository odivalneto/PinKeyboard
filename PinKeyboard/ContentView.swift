//
//  ContentView.swift
//  PinKeyboard
//
//  Created by Odival Neto on 07/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            Text(text)
                .font(.largeTitle)
                .frame(height: 40)
            
            KeyboardView($text, leadingAction: {
                
                if !text.isEmpty {
                    text.removeAll()
                }
                
            }, trailingAction: {
                
                if !text.isEmpty {
                    text.removeLast()
                }
                
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
