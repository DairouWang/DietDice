//
//  RecipesViewModel.swift
//  DietDice
//
//  Created by Darol on 8/2/24.
//

import Foundation


class RecipesViewModel: ObservableObject {
    @Published private(set) var recipes:[Recipe] = []
    
    init() {
        recipes = Recipe.all
    }
}
