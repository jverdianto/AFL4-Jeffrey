//
//  Ingredient.swift
//  AFL4 Jeffrey
//
//  Created by MacBook Pro on 28/05/22.
//

import Foundation
import SwiftUI

struct Ingredient: Hashable, Codable {
    var strIngredient1: String
    var strDescription: String
}

struct Ingredientclass: Hashable, Codable{
    let drinks: [Ingredient]
}
