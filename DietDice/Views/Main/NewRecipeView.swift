//
//  NewRecipeView.swift
//  DietDice
//
//  Created by Darol on 7/10/24.
//

import SwiftUI

struct NewRecipeView: View {
    @State private var showAddRecipe = false
    var body: some View {

        NavigationView {
            Button("Add recipe manully"){
                showAddRecipe = true
            }
                .navigationTitle("New Recipe")
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showAddRecipe, content: {
            AddRecipeView()
        })
    }
}

#Preview {
    NewRecipeView()
}
