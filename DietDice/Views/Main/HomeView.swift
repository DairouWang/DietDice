//
//  HomeView.swift
//  DietDice
//
//  Created by Darol on 7/10/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView{
                RecipeList(recipes : Recipe.all)
            }
            .navigationTitle("My Recipes")
        }
        .navigationViewStyle(.stack)
    }
    
}

#Preview {
    HomeView()
}
