//
//  DrinkDetail.swift
//  AFL4 Jeffrey
//
//  Created by MacBook Pro on 28/05/22.
//

import SwiftUI

struct DrinkDetail: View {
    var drink: Drink
    
    var body: some View {
        ScrollView {
            SwiftUI.Text(drink.strDrink)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding([.leading, .bottom, .trailing], 20.0)
            
            URLImageDrinkDetail(urlString: drink.strDrinkThumb)
            
            SwiftUI.Text("Ingredients")
                .font(.title2)
                .fontWeight(.bold)
                .padding(20.0)
            
            if drink.strIngredient1 != nil {
                if drink.strMeasure1 != nil {
                    SwiftUI.Text(drink.strMeasure1!) + SwiftUI.Text(drink.strIngredient1!)
                }else{
                    SwiftUI.Text(drink.strIngredient1!)
                }
            }

            if drink.strIngredient2 != nil {
                if drink.strMeasure2 != nil {
                    SwiftUI.Text(drink.strMeasure2!) + SwiftUI.Text(drink.strIngredient2!)
                }else{
                    SwiftUI.Text(drink.strIngredient2!)
                }
            }
            
            if drink.strIngredient3 != nil {
                if drink.strMeasure3 != nil {
                    SwiftUI.Text(drink.strMeasure3!) + SwiftUI.Text(drink.strIngredient3!)
                }else{
                    SwiftUI.Text(drink.strIngredient3!)
                }
            }

            if drink.strIngredient4 != nil {
                if drink.strMeasure4 != nil {
                    SwiftUI.Text(drink.strMeasure4!) + SwiftUI.Text(drink.strIngredient4!)
                }else{
                    SwiftUI.Text(drink.strIngredient4!)
                }
            }

            if drink.strIngredient5 != nil {
                if drink.strMeasure5 != nil {
                    SwiftUI.Text(drink.strMeasure5!) + SwiftUI.Text(drink.strIngredient5!)
                }else{
                    SwiftUI.Text(drink.strIngredient5!)
                }
            }
            
            SwiftUI.Text("Instructions")
                .font(.title2)
                .fontWeight(.bold)
                .padding([.top, .leading, .trailing], 20.0)
            
            SwiftUI.Text(drink.strInstructions)
                .font(.body)
                .padding()
            
        }
    }
}

struct URLImageDrinkDetail: View {
    let urlString: String
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .frame(width: 300, height: 300)
                .cornerRadius(15)
        }
        else {
            Image("")
                .resizable()
                .frame(width: 300, height: 300)
                .cornerRadius(15)
                .onAppear{
                    fetchData()
                }
        }
    }
    
    func fetchData() {
        guard let url = URL(string: urlString) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, _, _  in
            self.data = data
        }
        task.resume()
    }
}


struct DrinkDetail_Previews: PreviewProvider {
    static var previews: some View {
        DrinkDetail(drink: drinks[0])
    }
}
