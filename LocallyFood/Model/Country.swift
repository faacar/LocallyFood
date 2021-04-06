//
//  Country.swift
//  LocallyFood
//
//  Created by Ahmet Acar on 6.04.2021.
//

import Foundation

struct Country: Codable {
    //https://www.themealdb.com/api/json/v1/1/list.php?a=list
    let countryName: String
    
    enum CodingKeys: String, CodingKey {
        case countryName = "strArea"
    }
}
