//
//  AddRecipeView.swift
//  DietDice
//
//  Created by Darol on 7/29/24.
//

import SwiftUI

struct AddRecipeView: View {
    @EnvironmentObject var recipesVM:RecipesViewModel
    
    @State private var name:String = ""
    @State private var selectedCategory: Category = Category.meat
    @State private var description:String = ""
    @State private var ingredients:String = ""
    @State private var directions:String = ""
    @State private var protein:String = ""
    @State private var carb:String = ""
    @State private var fat:String = ""
    @State private var navigateToRecipe = false
    
    @State private var selectedImage: UIImage?
    @State private var isImagePickerPresented = false
    
    @Environment(\.dismiss) var dismiss
    
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
                Section(header: Text("Image")) {
                    if let image = selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    }
                    Button(action: {
                        isImagePickerPresented = true
                    }) {
                        Text(selectedImage == nil ? "Select Image" : "Change Image")
                    }
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
                Section(header: Text("Protein")) {
                    TextEditor(text: $protein)
                }
                Section(header: Text("Carb")) {
                    TextEditor(text: $carb)
                }
                Section(header: Text("Fat")) {
                    TextEditor(text: $fat)
                }
            }
            .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button {
                                    dismiss()
                                } label: {
                                    Label("Cancel", systemImage: "xmark")
                                        .labelStyle(.iconOnly)
                                }
                            }
                            ToolbarItem {
                                NavigationLink(isActive: $navigateToRecipe) {
                                    if let latestRecipe = recipesVM.recipes.sorted(by: { $0.datePublished > $1.datePublished }).first {
                                        RecipeView(recipe: latestRecipe)
                                            .navigationBarBackButtonHidden(true)
                                    }
                                } label: {
                                    Button {
                                        saveRecipe()
                                        navigateToRecipe = true
                                    } label: {
                                        Label("Done", systemImage: "checkmark")
                                            .labelStyle(.iconOnly)
                                    }
                                }
                                .disabled(name.isEmpty)
                            }
                        }
            .navigationTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
        sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(selectedImage: $selectedImage)
        }
    }
    
    
    func saveRecipe() {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let datePublished = dateFormatter.string(from: now)
        let newRecipe = Recipe(row : [name: name, "image": "", description: description, ingredients: ingredients, directions: directions, protein: protein, carb: carb, fat: fat, "category": selectedCategory.rawValue, datePublished: datePublished, "isFavorite": false])
        
        recipesVM.addRecipe(recipe: newRecipe)
    }
    
    
}

    struct AddRecipeView_Previews: PreviewProvider {
        static var previews: some View {
            AddRecipeView()
                .environmentObject(RecipesViewModel())
        }
    }
