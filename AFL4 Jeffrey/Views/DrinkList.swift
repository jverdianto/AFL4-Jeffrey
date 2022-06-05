//
//  DrinkList.swift
//  AFL4 Jeffrey
//
//  Created by MacBook Pro on 28/05/22.
//

import SwiftUI

struct DrinkList: View {
    @StateObject var viewModeldrink = ViewModelDrink()
    @State var searchText = ""
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModeldrink.filteredDrink, id:\.self){ Drink in
                    NavigationLink(destination: DrinkDetail(drink: Drink)) {
                        DrinkRow(drink: Drink)
                    }
                }
            }
            .navigationTitle("Drink List")
            .searchable(text: $searchText, prompt: "Find a drink")
            .onChange(of: searchText) { data in
                viewModeldrink.search(with: data)
            }
            .onAppear(){
                viewModeldrink.search()
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
