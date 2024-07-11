//
//  FavoritesView.swift
//  DietDice
//
//  Created by Darol on 7/10/24.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        NavigationView {
            Text("You don't have any favorites yet.")
                .navigationTitle("Favorites")
        }
    }
}

#Preview {
    FavoritesView()
}
