//
//  Item.swift
//  WishList
//
//  Created by Brandon Rodriguez on 1/15/24.
//

import Foundation
import SwiftData

@Model
class Item {
    
    var name: String
    var date: Date
    var value: Double
    
    init(name: String, date: Date, value: Double) {
        
        self.name = name
        self.date = date
        self.value = value
        
    }
    
}
