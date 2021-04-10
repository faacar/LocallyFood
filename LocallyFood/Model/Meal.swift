//
//  Meal.swift
//  LocallyFood
//
//  Created by Ahmet Acar on 6.04.2021.
//

import Foundation

struct Meal: Codable, Hashable {
    //https://www.themealdb.com/api/json/v1/1/lookup.php?i=52767
    let id: String
    let name: String
    let category: String?
    let type: String?
    let instructions: String?
    let thumbnail: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case category = "strCategory"
        case type = "strArea"
        case instructions = "strInstructions"
        case thumbnail = "strMealThumb"
    }
}
