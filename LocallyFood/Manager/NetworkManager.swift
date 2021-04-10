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
    
    func getReceipe(id: String, completionHandler: @escaping (Result<[Meal], LFError>) -> Void) {
        let request = AF.request("\(baseURL)/lookup.php", parameters: ["i":id])
        request.responseDecodable(of: Receipe.self) { (response) in
            guard let data = response.value else {
                completionHandler(.failure(.decodeError))
                return
            }
            completionHandler(.success(data.meals))
        }
    }
    
    func getCategories(completionHandler: @escaping (Result<[Category], LFError>) -> Void){
        let request = AF.request("\(baseURL)/categories.php")
        request.responseDecodable(of: Categories.self) { (response) in
            guard let data = response.value else {
                completionHandler(.failure(.decodeError))
            return
            }
            completionHandler(.success(data.categories))
        }
    }
    
    func getCountries(completionHandler: @escaping (Result<[Country], LFError>) -> Void){
        let request = AF.request("\(baseURL)/list.php", parameters: ["a":"list"])
        request.responseDecodable(of: Countries.self) { (response) in
            guard let data = response.value else {
                completionHandler(.failure(.decodeError))
            return
          }
            completionHandler(.success(data.meals))
        }
    }
    
    func getLists(type: String, info: String, completionHandler: @escaping (Result<[List], LFError>) -> Void){
        let request = AF.request("\(baseURL)/filter.php", parameters: [type:info])
        request.responseDecodable(of: Lists.self) { (response) in
            guard let data = response.value else {
                completionHandler(.failure(.decodeError))
            return
            }
            completionHandler(.success(data.meals))
        }
    }
}
