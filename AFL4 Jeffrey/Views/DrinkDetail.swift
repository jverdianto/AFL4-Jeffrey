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
            
            SwiftUI.Text(drink.strMeasure1 + drink.strIngredient1)
            SwiftUI.Text(drink.strMeasure2 + drink.strIngredient2)
            SwiftUI.Text(drink.strMeasure3 + drink.strIngredient3)
            
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
