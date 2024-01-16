//
//  WishListApp.swift
//  WishList
//
//  Created by Brandon Rodriguez on 1/15/24.
//

import SwiftUI
import SwiftData

@main
struct WishListApp: App {
    
    var body: some Scene {
        
        WindowGroup {
            
            HomeView()
                .modelContainer(for: Item.self)
        }
        
    }
    
}
