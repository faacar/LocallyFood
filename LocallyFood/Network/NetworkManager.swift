//
//  NetworkManager.swift
//  LocallyFood
//
//  Created by Ahmet Acar on 7.04.2021.
//

import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://www.themealdb.com/api/json/v1/1"
    
    private init () {}
    
    func getReceipe(id: String) -> [Meal] {
        let request = AF.request("\(baseURL)/lookup.php?i=\(id)")
        var result = [Meal]()
        request.responseDecodable(of: Receipe.self) { (response) in
          guard let data = response.value else { return }
            print(data.meals[0])
            result = data.meals
        }
        return result
    }
    
    func getCategories() -> [Category]{
        let request = AF.request("\(baseURL)/categories.php")
        var result = [Category]()
        request.responseDecodable(of: Categories.self) { (response) in
          guard let data = response.value else { return }
            print(data.categories)
            result = data.categories
        }
        return result
    }
    
    func getCountries() -> [Country]{
        let request = AF.request("\(baseURL)//list.php?a=list")
        var result = [Country]()
        request.responseDecodable(of: Countries.self) { (response) in
          guard let data = response.value else { return }
            result = data.meals
        }
        return result
    }
    
    func getLists(type: String, info: String) -> [List]{
        let request = AF.request("\(baseURL)filter.php?\(type)=\(info)")
        var result = [List]()
        request.responseDecodable(of: Lists.self) { (response) in
          guard let data = response.value else { return }
            print("anan")
            print(data.list)
            result = data.list
        }
        return result
    }
    
    
}
