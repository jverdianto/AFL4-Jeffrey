//
//  Drink.swift
//  AFL4 Jeffrey
//
//  Created by MacBook Pro on 28/05/22.
//

import Foundation
import SwiftUI

struct Drink: Hashable, Codable {
    var idDrink: String
    var strDrink: String
    var strCategory: String
    var strInstructions: String
    var strIngredient1: String
    
    var strDrinkThumb: String
    var image: Image {
        Image(strDrinkThumb)
    }
}

struct Drinkclass: Hashable, Codable{
    let drinks: [Drink]
}
