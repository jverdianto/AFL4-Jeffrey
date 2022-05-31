//
//  ViewModel.swift
//  AFL4 Jeffrey
//
//  Created by MacBook Pro on 28/05/22.
//

import Foundation
import SwiftUI

class ViewModelDrink: ObservableObject{
    @Published var drink: [Drink] = []

    func fetch(){
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=c") else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }

            //Convert to JSON
            do{
                let drinks = try JSONDecoder().decode(Drinkclass.self, from: data)
                DispatchQueue.main.async {
                    self?.drink = drinks.drinks
                }
                
            }
            catch{

            }

        }
        task.resume()
    }
}

class ViewModelIngredient: ObservableObject{
    @Published var ingredient: [Ingredient] = []

    func fetch(){
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list") else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }

            //Convert to JSON
            do{
                let ingredients = try JSONDecoder().decode(Ingredientclass.self, from: data)
                DispatchQueue.main.async {
                    self?.ingredient = ingredients.drinks
                }
                
            }
            catch{

            }

        }
        task.resume()
    }
}
