//
//  TabBar.swift
//  DietDice
//
//  Created by Darol on 7/10/24.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            CategoriesView()
                .tabItem {
                    Label("Categories", systemImage: "square.fill.text.grid.1x2")
                }
            
            NewRecipeView()
                .tabItem {
                    Label("New", systemImage: "plus.app")
                }
            
            FavoritesView()
                .tabItem {
                    Label("Favorite", systemImage: "heart")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        
        }
    }
}

#Preview {
    TabBar()
}
