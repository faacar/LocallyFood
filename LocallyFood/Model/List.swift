//
//  List.swift
//  LocallyFood
//
//  Created by Ahmet Acar on 7.04.2021.
//

import Foundation

struct List: Codable {
    //https://www.themealdb.com/api/json/v1/1/filter.php?a=Canadian
    //https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert
    let name: String
    let thumbnail: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnail = "strMealThumb"
    }
}
