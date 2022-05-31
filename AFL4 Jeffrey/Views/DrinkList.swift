//
//  DrinkList.swift
//  AFL4 Jeffrey
//
//  Created by MacBook Pro on 28/05/22.
//

import SwiftUI

struct DrinkList: View {
    @StateObject var viewModeldrink = ViewModelDrink()
    var body: some View {
        NavigationView {
            List() {
                ForEach(viewModeldrink.drink, id:\.self){ Drink in
                    NavigationLink(destination: DrinkDetail(drink: Drink)) {
                        DrinkRow(drink: Drink)
                    }
                }
            }
            .navigationTitle("Drink List")
            .onAppear(){
                viewModeldrink.fetch()
            }

        }
    }
}

struct DrinkList_Previews: PreviewProvider {
    static var previews: some View {
        DrinkList()
    }
}
