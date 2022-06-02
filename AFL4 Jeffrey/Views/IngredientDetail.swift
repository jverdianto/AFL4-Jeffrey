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
        ScrollView {
            SwiftUI.Text(ingredient.strIngredient1)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding([.leading, .bottom, .trailing, .top], 20.0)
            
//            SwiftUI.Text("Description")
//                .font(.title2)
//                .fontWeight(.bold)
//                .padding([.top, .leading, .trailing], 20.0)
            
            SwiftUI.Text(ingredient.strDescription)
                .font(.body)
                .padding()
        }
    }
}

struct IngredientDetail_Previews: PreviewProvider {
    static var previews: some View {
        IngredientDetail(ingredient: ingredients[0])
    }
}
