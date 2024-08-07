//
//  ContentView.swift
//  DietDice
//
//  Created by Darol on 7/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabBar()
    }
}

#Preview {
    ContentView()
        .environmentObject(RecipesViewModel())
}
