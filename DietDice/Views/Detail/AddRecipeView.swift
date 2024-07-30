//
//  AddRecipeView.swift
//  DietDice
//
//  Created by Darol on 7/29/24.
//

import SwiftUI

struct AddRecipeView: View {
    
    @State private var name:String = ""
    @State private var selectedCategory: Category = Category.meat
    @State private var description:String = ""
    @State private var ingredients:String = ""
    @State private var directions:String = ""
    
    var body: some View {

        NavigationView{
            Form{
                Section(header: Text("Name")) {
                    TextField("Recipe Name", text: $name)
                }
                Section(header: Text("Category")) {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(Category.allCases) {category in
                            Text(category.rawValue)
                                .tag(category)
                        }
                    }
                    .pickerStyle(.menu)
                }
                Section(header: Text("Description")) {
                    TextEditor(text: $description)
                }
                Section(header: Text("Ingredients")) {
                    TextEditor(text: $ingredients)
                }
                Section(header: Text("Directions")) {
                    TextEditor(text: $directions)
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        
                    } label: {
                        Label("Cancel", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }
                }
                ToolbarItem{
                    Button{
                        
                    } label: {
                        Label("Done", systemImage: "checkmark")
                            .labelStyle(.iconOnly)
                    }
                    .disabled(name.isEmpty)
                }
            })
            .navigationTitle("New Recipe")
                .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    AddRecipeView()
}
