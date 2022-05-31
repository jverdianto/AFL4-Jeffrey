//
//  ContentView.swift
//  AFL4 Jeffrey
//
//  Created by MacBook Pro on 28/05/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .home
    
    enum Tab {
        case home
        case drinks
        case ingredients
    }
    
    var body: some View {
        
        TabView(selection: $selection) {
            Home()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(Tab.home)

            DrinkList()
                .tabItem {
                    Label("Drinks", systemImage: "takeoutbag.and.cup.and.straw.fill")
                }
                .tag(Tab.drinks)
            IngredientList()
                .tabItem {
                    Label("Ingredients", systemImage: "list.bullet")
                }
                .tag(Tab.ingredients)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
