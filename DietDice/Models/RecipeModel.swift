//
//  RecipeModel.swift
//  DietDice
//
//  Created by Darol on 7/10/24.
//

import Foundation

enum Category: String, CaseIterable, Identifiable{
    var id:String {self.rawValue}
    case breakfast = "Breakfast"
    case meat = "Meat"
    case vegetable = "Vegetable"
    case carbs = "Carbs"
    case snack = "Snack"
    case drink = "Drink"
}

struct Recipe: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let description:String
    let ingredients:String
    let directions: String
    let Protein: String
    let Carb: String
    let Fat: String
    let category: Category.RawValue
    let datePublished: String
}

extension Recipe {
    static let all: [Recipe] = [
        Recipe(name: "葱油鸡", image: "https://i.postimg.cc/9Qp4cFTn/FDB9485-A-A7-A2-45-CB-825-F-CD86-AAC2526-A-1-201-a.jpg", description: "很好吃的葱油鸡", ingredients: "洋葱半个，小葱一把，去皮鸡腿肉700g", directions: "1111", Protein: "111", Carb: "111", Fat: "111", category: "Meat", datePublished: "07/10/2024"),
        Recipe(name: "菜包", image: "https://images.pexels.com/photos/25396183/pexels-photo-25396183.jpeg", description: "葱油鸡", ingredients: "洋葱半个，小葱一把，去皮鸡腿肉700g", directions: "1111", Protein: "111", Carb: "111", Fat: "111", category: "Meat", datePublished: "07/10/2024"),
        Recipe(name: "chicken feet", image: "String", description: "葱油鸡", ingredients: "洋葱半个，小葱一把，去皮鸡腿肉700g", directions: "1111", Protein: "111", Carb: "111", Fat: "111", category: "Meat", datePublished: "07/10/2024")
    ]
}
 
