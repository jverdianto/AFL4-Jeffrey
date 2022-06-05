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
    @Published var filteredDrink = [Drink]()

    func fetch(){
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=m") else {
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
                    self?.filteredDrink = drinks.drinks
                }
                
            }
            catch{

            }

        }
        task.resume()
    }
    
    func search(with query: String = "") {
        filteredDrink = query.isEmpty ? drink : drink.filter { $0.strDrink.localizedStandardContains(query) }
    }
}
