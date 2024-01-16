//
//  NewItemView.swift
//  WishList
//
//  Created by Brandon Rodriguez on 1/15/24.
//

import SwiftUI

struct NewItemView: View {
    
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var date: Date = .now
    @State private var value: Double = 0
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                
                TextField("Item Name", text: $name)
                
                DatePicker("Date", selection: $date, displayedComponents: .date)
                
                TextField("Value", value: $value, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
                
            }
            .navigationTitle("New Item")
            .toolbar {
                
                ToolbarItemGroup(placement: .topBarLeading) {
                    
                    Button("Cancel") { dismiss() }
                        .foregroundStyle(.red)
                    
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    
                    Button("Save") {
                        
                        let item = Item(name: name, date: date, value: value)
                        context.insert(item)
                        
                        dismiss()
                        
                    }
                    .foregroundStyle(.indigo)
                    
                }
                
            }
            
        }
        
    }
    
}

#Preview {
    NewItemView()
}
