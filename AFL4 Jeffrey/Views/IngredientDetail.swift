//
//  IngredientDetail.swift
//  AFL4 Jeffrey
//
//  Created by MacBook Pro on 31/05/22.
//

import SwiftUI

struct IngredientDetail: View {
    var ingredient: Ingredient
    
    var body: some View {
        Text(ingredient.strIngredient1)
    }
}

struct IngredientDetail_Previews: PreviewProvider {
    static var previews: some View {
        IngredientDetail(ingredient: ingredients[0])
    }
}
