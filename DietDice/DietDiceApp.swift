//
//  DietDiceApp.swift
//  DietDice
//
//  Created by Darol on 7/10/24.
//

import SwiftUI

@main
struct DietDiceApp: App {
    @StateObject var recipesViewModel = RecipesViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipesViewModel)
        }
    }
}
