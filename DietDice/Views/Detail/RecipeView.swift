//
//  RecipeView.swift
//  DietDice
//
//  Created by Darol on 7/24/24.
//

import SwiftUI

struct RecipeView: View {
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: recipe.image)){
                image in image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight:.infinity)
            }
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.3), Color.gray]), startPoint: .top, endPoint: .bottom))
            VStack(spacing:0) {
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    .safeAreaPadding(30)
                
                VStack(alignment: .leading, spacing:30, content: {
                    if !recipe.description.isEmpty {
                        Text(recipe.description)
                    }
                    
                    if !recipe.ingredients.isEmpty {
                        VStack(alignment: .leading, spacing:20, content: {
                            Text("Ingredients")
                                .font(.headline)
                            
                            Text(recipe.ingredients)
                        })
                    }
                    
                    if !recipe.directions.isEmpty {
                        VStack(alignment: .leading, spacing:20, content: {
                            Text("Directions")
                                .font(.headline)
                            
                            Text(recipe.directions)
                        })
                    }
                    if !recipe.protein.isEmpty {
                        VStack(alignment: .leading, spacing:20, content: {
                            Text("Protein")
                                .font(.headline)
                            
                            Text(recipe.protein)
                        })
                    }
                    if !recipe.carb.isEmpty {
                        VStack(alignment: .leading, spacing:20, content: {
                            Text("Carb")
                                .font(.headline)
                            
                            Text(recipe.carb)
                        })
                    }                    
                    if !recipe.fat.isEmpty {
                        VStack(alignment: .leading, spacing:20, content: {
                            Text("Fat")
                                .font(.headline)
                            
                            Text(recipe.fat)
                        })
                    }
                })
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea(.container, edges:.top)
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipe: RecipeView_Previews.sampleRecipe)
    }
    
    static var sampleRecipe: Recipe {
            Recipe(row: [
                "id": 1,
                "name": "Sample Recipe",
                "image": "",  // You can add a sample base64 encoded image string here if needed
                "description": "This is a sample recipe description.",
                "ingredients": "Ingredient 1, Ingredient 2, Ingredient 3",
                "directions": "Step 1: Do this. Step 2: Do that.",
                "protein": "20g",
                "carb": "30g",
                "fat": "10g",
                "category": "Meat",
                "datePublished": "2024-07-10",
                "isFavorite": false
            ])
        }
}
