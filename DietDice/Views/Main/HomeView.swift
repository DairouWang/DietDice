//
//  HomeView.swift
//  DietDice
//
//  Created by Darol on 7/10/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var recipesVM:RecipesViewModel
    
    var body: some View {
        NavigationView {
            ScrollView{
                RecipeList(recipes : recipesVM.recipes)
            }
            .navigationTitle("My Recipes")
        }
        .navigationViewStyle(.stack)
    }
    
}

#Preview {
    HomeView()
        .environmentObject(RecipesViewModel())
}
