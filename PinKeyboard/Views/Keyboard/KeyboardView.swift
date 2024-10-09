//
//  KeyboardView.swift
//  PinKeyboard
//
//  Created by Odival Neto on 08/10/24.
//

import SwiftUI

struct KeyboardView: View {
    
    let keys: [KeyboardModel] = [
        .init(id: 1, value: "1", icon: "", type: .key),
        .init(id: 2, value: "2", icon: "", type: .key),
        .init(id: 3, value: "3", icon: "", type: .key),
        .init(id: 4, value: "4", icon: "", type: .key),
        .init(id: 5, value: "5", icon: "", type: .key),
        .init(id: 6, value: "6", icon: "", type: .key),
        .init(id: 7, value: "7", icon: "", type: .key),
        .init(id: 8, value: "8", icon: "", type: .key),
        .init(id: 9, value: "9", icon: "", type: .key),
        .init(id: 10, value: "", icon: "arrow.uturn.backward", type: .leadingAction),
        .init(id: 11, value: "0", icon: "", type: .key),
        .init(id: 12, value: "", icon: "delete.left", type: .trailingAction),
    ]
    let gridKey = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var leadingAction: () -> Void
    @State private var trailingAction: () -> Void
    @Binding var text: String
    
    init(_ text: Binding<String>, leadingAction: @escaping () -> Void, trailingAction: @escaping () -> Void) {
        self.leadingAction = leadingAction
        self.trailingAction = trailingAction
        _text = text
    }
    
    var body: some View {
        
        LazyVGrid(columns: gridKey, content: {
            
            ForEach(keys, content: { key in
                Button(action: {
                    
                    switch key.type {
                            
                        case .key:
                            text.append(key.value)
                            
                        case .leadingAction:
                            leadingAction()
                            
                        case .trailingAction:
                            trailingAction()
                            
                    }
                    
                }, label: {
                    
                    switch key.type {
                        case .key:
                            Text(key.value)
                            
                        case .leadingAction, .trailingAction:
                            Image(systemName: key.icon)
                    }
                    
                })
                
            })
            
        })
        .pinKeyboard()
        
    }
}

#Preview {
    KeyboardView(.constant(""), leadingAction: {
        print("leading action")
    }, trailingAction: {
        print("trailing action")
    })
}
