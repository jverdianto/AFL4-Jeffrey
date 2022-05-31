//
//  Test2.swift
//  AFL4 Jeffrey
//
//  Created by MacBook Pro on 31/05/22.
//

//import SwiftUI
//
//struct Test2: View {
//    @State private var searchText = ""
//    var names = ["Goku", "Gohan", "Vegeta", "Trunks", "Cell", "Frieza"]
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(names, id: \.self) { name in
//                    Text(name)
//                }
//            }
////            .searchable("Search Contacts...", text: $searchText)
////            .navigationTitle("Contacts")
//        }
//    }
//
//    var searchResults: [String] {
//        if searchText.isEmpty {
//            return names
//        }else {
//            return names.filter({ $0.contains(searchText) })
//        }
//    }
//}
//
//struct Test2_Previews: PreviewProvider {
//    static var previews: some View {
//        Test2()
//    }
//}
