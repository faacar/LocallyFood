//
//  LocallyFood.swift
//  LocallyFood
//
//  Created by Ahmet Acar on 7.04.2021.
//

import Foundation
import Moya

public enum LocallyFood {
    case receipe(String) // id
    case categories
    case countries
    case lists(String, String) //type - info
}

extension LocallyFood: TargetType {
    public var baseURL: URL { return URL(string: "https://www.themealdb.com/api/json/v1/1")! }
    
    public var path: String {
        switch self {
        case .receipe(let id):
            return "/lookup.php?i=\(id)"
        case .categories:
            return "categories.php"
        case .countries:
            return "/list.php?a=list"
        case .lists(let type, let info):
            return "filter.php?\(type)=\(info)"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        //return .requestPlain
//        switch self {
//        case .categories:
//            return .requestParameters(parameters: ["sort": "pushed"], encoding: URLEncoding.default)
//        default:
//            return .requestPlain
//        }
        switch self {
        case .receipe(let anan):
        return .requestParameters(parameters: ["i" : "\(anan)"], encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        //return ["Content-Type": "application/json"]
        return nil
    }
    
    public var validationType: ValidationType{
        return .successCodes
    }
}



