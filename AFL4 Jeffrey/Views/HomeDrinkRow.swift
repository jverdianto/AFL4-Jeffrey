//
//  HomeDrinkRow.swift
//  AFL4 Jeffrey
//
//  Created by MacBook Pro on 28/05/22.
//

import SwiftUI

struct HomeDrinkRow: View {
    var drink: Drink
    
    var body: some View {
        HStack {
            URLImageHomeDrinkRow(urlString: drink.strDrinkThumb)
        }
    }
}

struct URLImageHomeDrinkRow: View {
    let urlString: String
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .frame(width: 140, height: 140)
                .cornerRadius(10)
                .padding(.leading)
        }
        else {
            Image("")
                .resizable()
                .frame(width: 140, height: 140)
                .cornerRadius(10)
                .padding(.leading)
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

struct HomeDrinkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeDrinkRow(drink: drinks[0])
            HomeDrinkRow(drink: drinks[1])
        }
        .previewLayout(.fixed(width: 150, height: 150))
    }
}
