//
//  ItemView.swift
//  WishList
//
//  Created by Brandon Rodriguez on 1/15/24.
//

import SwiftUI

struct ItemView: View {
    
    let item: Item
    
    var body: some View {
        
        HStack {
            
            HStack {
                
                Text(item.date, format: .dateTime.month(.abbreviated).day())
                
                Text(item.name)
                
                Spacer()
                
                Text(item.value, format: .currency(code: "USD"))
                    .foregroundStyle(.indigo)
                
            }
            
        }
        
    }
    
}
