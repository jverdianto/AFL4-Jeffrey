//
//  ModelData.swift
//  AFL4 Jeffrey
//
//  Created by MacBook Pro on 28/05/22.
//

import Foundation

var drinks: [Drink] = load("drinkData.json")
var ingredients: [Ingredient] = load("ingredientData.json")
var filteredIngredient = ingredients

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

class ModelDataIngredient {
    func search(with query: String = "") {
        filteredIngredient = query.isEmpty ? ingredients : ingredients.filter { $0.strIngredient1.localizedStandardContains(query) }
    }
}
