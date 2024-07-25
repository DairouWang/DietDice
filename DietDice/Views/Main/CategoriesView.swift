//
//  CategoriesView.swift
//  DietDice
//
//  Created by Darol on 7/10/24.
//

import SwiftUI

struct CategoriesView: View {
    var body: some View {
        NavigationView {
            List{
                ForEach(Category.allCases) {
                    category in
                    NavigationLink{
                        CategoryView(category: category)
                    } label: {
                        Text(category.rawValue)
                    }
                }
            }
                .navigationTitle("Categories")
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    CategoriesView()
}
