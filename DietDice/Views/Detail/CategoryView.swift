//
//  CategoryView.swift
//  DietDice
//
//  Created by Darol on 7/24/24.
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var recipesVM:RecipesViewModel

    var category: Category
    
    var recipes: [Recipe] {
        return recipesVM.recipes.filter{ $0.category == category.rawValue}
    }
    var body: some View {
        ScrollView {
            RecipeList(recipes: recipes)
        }
        .navigationTitle(category.rawValue)
    }
}

#Preview {
    CategoryView(category: Category.meat)
        .environmentObject(RecipesViewModel())
}
