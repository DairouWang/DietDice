//
//  RecipeModel.swift
//  DietDice
//
//  Created by Darol on 7/10/24.
//

import Foundation
import GRDB

enum Category: String, CaseIterable, Identifiable{
    var id:String {self.rawValue}
    case breakfast = "Breakfast"
    case meat = "Meat"
    case vegetable = "Vegetable"
    case carbs = "Carbs"
    case snack = "Snack"
    case drink = "Drink"
}

struct Recipe: Identifiable, Codable, FetchableRecord, PersistableRecord {
    let id: UUID
    let name: String
    let image: String
    let description:String
    let ingredients:String
    let directions: String
    let protein: String
    let carb: String
    let fat: String
    let category: Category.RawValue
    let datePublished: String
    var isFavorite: Bool
    
    init(row: Row) {
            id = row["id"]
            name = row["name"]
            image = row["image"]
            description = row["description"]
            ingredients = row["ingredients"]
            directions = row["directions"]
            protein = row["Protein"]
            carb = row["Carb"]
            fat = row["Fat"]
            category = row["category"]
            datePublished = row["datePublished"]
            isFavorite = row["isFavorite"]
        }
}

//extension Recipe {
//    static let all: [Recipe] = [
//        Recipe(name: "葱油鸡", image: "https://i.postimg.cc/9Qp4cFTn/FDB9485-A-A7-A2-45-CB-825-F-CD86-AAC2526-A-1-201-a.jpg", description: "很好吃的葱油鸡", ingredients: "洋葱半个，小葱一把，去皮鸡腿肉700g", directions: "1111", protein: "111", carb: "111", fat: "111", category: "Meat", datePublished: "07/10/2024", ),
//        Recipe(name: "菜包", image: "https://media.istockphoto.com/id/1316145932/photo/table-top-view-of-spicy-food.jpg?s=1024x1024&w=is&k=20&c=VaRsD5pHXDCMcwcAsOGaaBadptx0nHaJUuVKpyWaq3A=", description: "葱油鸡", ingredients: "洋葱半个，小葱一把，去皮鸡腿肉700g", directions: "1111", protein: "111", carb: "111", fat: "111", category: "Meat", datePublished: "07/10/2024"),
//        Recipe(name: "chicken feet", image: "String", description: "葱油鸡", ingredients: "洋葱半个，小葱一把，去皮鸡腿肉700g", directions: "1111", protein: "111", carb: "111", fat: "111", category: "Meat", datePublished: "07/10/2024")
//    ]
//}
// 

extension Recipe {
    static let databaseTableName = "recipes"
    
    func encode(to container: inout PersistenceContainer) {
            container["id"] = id
            container["name"] = name
            container["image"] = image
        
            container["description"] = description
            container["ingredients"] = ingredients
            container["directions"] = directions
            container["Protein"] = protein
            container["Carb"] = carb
            container["Fat"] = fat
            container["category"] = category
            container["datePublished"] = datePublished
            container["isFavorite"] = isFavorite
        }
}
