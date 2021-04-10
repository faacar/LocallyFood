//
//  LocallyFood.swift
//  LocallyFood
//
//  Created by Ahmet Acar on 7.04.2021.
//

import Foundation

struct Receipe: Codable, Hashable {

    
    var meals: [Meal]
}

struct Categories: Codable {
    var categories: [Category]
}

struct Countries: Codable {
    var meals: [Country]
}

struct Lists: Codable {
    let meals: [List]
}
