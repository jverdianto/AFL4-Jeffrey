//
//  IngredientList.swift
//  AFL4 Jeffrey
//
//  Created by MacBook Pro on 31/05/22.
//

import SwiftUI

struct IngredientList: View {
    @StateObject var viewModelingredient = ViewModelIngredient()
    var body: some View {
        NavigationView {
            List() {
                ForEach(viewModelingredient.ingredient, id:\.self){ Ingredient in
                    NavigationLink(destination: IngredientDetail(ingredient: Ingredient)) {
                        Text(Ingredient.strIngredient1)
                    }
                }
            }
            .navigationTitle("Ingredient List")
            .onAppear(){
                viewModelingredient.fetch()
            }

        }
    }
}

struct IngredientList_Previews: PreviewProvider {
    static var previews: some View {
        IngredientList()
    }
}
