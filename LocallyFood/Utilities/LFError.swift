//
//  LFError.swift
//  LocallyFood
//
//  Created by Ahmet Acar on 7.04.2021.
//

import Foundation

enum LFError: String, Error {
    
    case urlError = "String value couldn't convert the string"
    case decodeError = "url couldn't decoded"
    case unexpectedError = "Unexpected error found please try again later"
    case alreadyInFavorites = "You've already favorited this user."
    case unableToFavorite   = "There was an error favoriting this user. Please try again."
    case updateError = "You couldn't add the food to your favorites, try again later"

}
