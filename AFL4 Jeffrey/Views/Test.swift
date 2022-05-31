//
//  Test.swift
//  AFL4 Jeffrey
//
//  Created by MacBook Pro on 28/05/22.
//

import SwiftUI

struct Test: View {
    @StateObject var viewModeldrink = ViewModelDrink()
    @StateObject var viewModelingredient = ViewModelIngredient()
    
    var body: some View {
        NavigationView{
            List{
                
//                ForEach(viewModeldrink.drink, id:\.self){ Drink in
//                    HStack{
//                        Text(Drink.strDrink)
//                    }
//                    .padding()
//                }

                ForEach(viewModeldrink.drink, id:\.self){ Drink in
                    HStack{
                        NavigationLink(destination: DrinkDetail(drink: Drink)) {
                            Text(Drink.strDrink)
                        }
                    }
                }
                
            }
            .navigationTitle("Drinks")
            .onAppear(){
                viewModeldrink.fetch()
                viewModelingredient.fetch()
            }
        }
        
//        if let data = data, let uiimage = UIImage(data: data) {
//            Image(uiImage: uiimage)
//                .resizable()
//                .aspectRatio(3 / 2, contentMode: .fit)
//        }
//        else {
//            Image("")
//                .aspectRatio(3 / 2, contentMode: .fit)
//                .background(Color.gray)
//                .onAppear{
//                    fetchData()
//                }
//        }
//    }
    
//    func fetchData() {
//        guard let url = URL(string: urlString) else{
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url){ data, _, _  in
//            self.data = data
//        }
//        task.resume()
//    }
        
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
