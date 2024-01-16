//
//  ContentView.swift
//  WishList
//
//  Created by Brandon Rodriguez on 1/15/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @Environment(\.modelContext) var context
    
    @Query(sort: \Item.date) var items: [Item]
    
    @State private var isShowingNewItem = false
    @State private var itemToEdit: Item?
    
    var body: some View {
        
        NavigationStack {
            
            List {
                
                ForEach(items) { item in
                
                    ItemView(item: item)
                        .onTapGesture { itemToEdit = item }
                    
                }
                .onDelete { indexSet in
                
                    for index in indexSet {
                        
                        context.delete(items[index])
                        
                    }
                    
                }
                
            }
            .navigationTitle("WishList")
            .sheet(isPresented: $isShowingNewItem) { NewItemView() }
            .sheet(item: $itemToEdit, content: { item in
                
                EditItemView(item: item)
                
            })
            .toolbar {
                
                if !items.isEmpty {
                    
                    Button("Add Item", systemImage: "plus") {
                        
                        isShowingNewItem = true
                        
                    }
                    
                }
                
            }
            .overlay {
                
                if items.isEmpty {
                    
                    ContentUnavailableView(label: {
                        
                        Label("No Items", systemImage: "list.bullet.rectangle.portrait")
                        
                    }, description: {
                        
                        Text("Start adding items to your wishlist.")
                        
                    }, actions: {
                        
                        Button("Add Item") { isShowingNewItem = true }
                        
                    })
                    .foregroundStyle(.indigo)
                    
                }
                
            }
            
        }
        
    }
    
}

#Preview {
    HomeView()
}
