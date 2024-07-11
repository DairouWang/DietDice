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
            List(Recipe.all) { recipe in
                Text(recipe.name)
                    .navigationTitle("My Recipes")
            }
        }
    }
}

#Preview {
    HomeView()
}
