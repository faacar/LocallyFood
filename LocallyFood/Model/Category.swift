//
//  Category.swift
//  LocallyFood
//
//  Created by Ahmet Acar on 6.04.2021.
//

import Foundation

struct Category: Codable {
    //https://www.themealdb.com/api/json/v1/1/categories.php

    let id: String
    let name: String
    let thumbnail: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case name = "strCategory"
        case thumbnail = "strCategoryThumb"
        case description = "strCategoryDescription"
    }
}
