//
//  IngredientList.swift
//  AFL4 Jeffrey
//
//  Created by MacBook Pro on 31/05/22.
//

import SwiftUI

struct IngredientList: View {
    @State var searchText = ""
    @State var modelDataingredient = ModelDataIngredient()
    var body: some View {
        NavigationView {
            List(filteredIngredient, id: \.self) { ingredient in
                NavigationLink {
                    IngredientDetail(ingredient: ingredient)
                } label: {
                    IngredientRow(ingredient: ingredient)
                }
            }
            .navigationTitle("Ingredient List")
            .searchable(text: $searchText, prompt: "Find an ingredient")
            .onChange(of: searchText) { data in
                modelDataingredient.search(with: data)
            }
            .onAppear(){
                modelDataingredient.search()
            }
        }
    }
}

struct IngredientList_Previews: PreviewProvider {
    static var previews: some View {
        IngredientList()
    }
}
