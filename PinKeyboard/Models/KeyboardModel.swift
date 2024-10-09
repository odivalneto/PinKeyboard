//
//  KeyboardModel.swift
//  PinKeyboard
//
//  Created by Odival Neto on 08/10/24.
//

import Foundation


struct KeyboardModel: Identifiable {
    
    enum typeKey: CaseIterable {
        case leadingAction, trailingAction, key
    }
    
    let id: Int
    let value: String
    let icon: String
    var type: typeKey
    
    init(id: Int, value: String, icon: String, type: typeKey) {
        self.id = id
        self.value = value
        self.icon = icon
        self.type = type
    }
    
    enum CodingKeys: String, CodingKey {
        case id, value, icon, type
    }
    
}
