//
//  IngredientList.swift
//  AFL4 Jeffrey
//
//  Created by MacBook Pro on 31/05/22.
//

import SwiftUI

struct IngredientList: View {
    @StateObject var viewModelingredient = ViewModelIngredient()
    @State var searchText = ""
    var body: some View {
//        NavigationView {
//            List {
//                ForEach(viewModelingredient.ingredient, id:\.self){ Ingredient in
//                    NavigationLink(destination: IngredientDetail(ingredient: Ingredient)) {
//                        Text(Ingredient.strIngredient1)
//                    }
//                }
//            }
//            .navigationTitle("Ingredient List")
//            .onAppear(){
//                viewModelingredient.fetch()
//            }

//        }
        NavigationView {
            List(ingredients, id: \.self) { ingredient in
                NavigationLink {
                    IngredientDetail(ingredient: ingredient)
                } label: {
                    IngredientRow(ingredient: ingredient)
                }
            }
            .navigationTitle("Ingredient List")
            .searchable(text: $searchText, prompt: "Find an ingredient")
            .onChange(of: searchText) { data in
                viewModelingredient.search(with: data)
            }
        }
    }
}

struct IngredientList_Previews: PreviewProvider {
    static var previews: some View {
        IngredientList()
    }
}
