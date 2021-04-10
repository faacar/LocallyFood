//
//  PersistentManger.swift
//  LocallyFood
//
//  Created by Ahmet Acar on 9.04.2021.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

struct PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    static private let favoritesKey = "favorites"
    
    
    
    static func updateWith(favorite: Meal, actionType: PersistenceActionType, completed: @escaping (LFError?) -> Void) {
        handleData { result in
            switch result {
            case .success(let favorites):
                var retrievedFavorites = favorites
                
                switch actionType {
                case .add: // add new food
                    guard !retrievedFavorites.contains(favorite) else {
                        completed(.alreadyInFavorites)
                        return
                    }
                    
                    retrievedFavorites.append(favorite)
                    
                case .remove: // delete food from favorites
                    retrievedFavorites.removeAll { $0.id == favorite.id}
                }
                
                completed(save(favorites: retrievedFavorites)) // save the total data
                
            case .failure(_):
                completed(.updateError)
            }
        }
    }
    
    
    static func handleData(completed: @escaping (Result<[Meal], LFError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: favoritesKey) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Meal].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }
    
    
    static func save(favorites: [Meal]) -> LFError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            print("encodedFavorites:\(encodedFavorites)")
            defaults.set(encodedFavorites, forKey: favoritesKey)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}
