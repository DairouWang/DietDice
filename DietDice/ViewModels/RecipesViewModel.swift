//
//  RecipesViewModel.swift
//  DietDice
//
//  Created by Darol on 8/2/24.
//

import Foundation
import GRDB


class RecipesViewModel: ObservableObject {
    private var dbQueue: DatabaseQueue
    @Published private(set) var recipes:[Recipe] = []
    
    init() {
        let databaseURL = try! FileManager.default
            .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("recipes.sqlite")
        dbQueue = try! DatabaseQueue(path: databaseURL.path())
        
        try! dbQueue.write{ db in
            try db.create(table: "recipes", ifNotExists: true) { t in
                  t.autoIncrementedPrimaryKey("id")
                  t.column("name", .text).notNull()
                  t.column("image", .text)
                  t.column("description", .text)
                  t.column("ingredients", .text)
                  t.column("directions", .text)
                  t.column("category", .text)
                  t.column("datePublished", .text)
                  t.column("protein", .text)
                  t.column("carb", .text)
                  t.column("fat", .text)
                  t.column("isFavorite", .boolean).notNull().defaults(to: false)
            }
        }
        
        loadRecipes()
    }
    
    func loadRecipes(){
        do{
            recipes = try dbQueue.read { db in
                try Recipe.fetchAll(db)
            }
        } catch {
            print("Failed to load recipes")
        }
    }
    
    func addRecipe(recipe: Recipe) {
        do {
            try dbQueue.write { db in
                var newRecipe = recipe
                try newRecipe.insert(db)
            }
            loadRecipes()
        } catch {
            print("Failed to add recipe: \(error.localizedDescription)")
        }
    }
}
