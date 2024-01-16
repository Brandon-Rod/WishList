//
//  EditItemView.swift
//  WishList
//
//  Created by Brandon Rodriguez on 1/15/24.
//

import SwiftUI

struct EditItemView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var item: Item
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                
                TextField("Item Name", text: $item.name)
                
                DatePicker("Date", selection: $item.date, displayedComponents: .date)
                
                TextField("Value", value: $item.value, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
                
            }
            .navigationTitle("New Item")
            .toolbar {
                
                ToolbarItemGroup(placement: .topBarLeading) {
                    
                    Button("Cancel") { dismiss() }
                        .foregroundStyle(.red)
                    
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    
                    Button("Done") { dismiss() }
                    .foregroundStyle(.indigo)
                    
                }
                
            }
            
        }
        
    }
    
}

