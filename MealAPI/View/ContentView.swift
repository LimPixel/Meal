//
//  ContentView.swift
//  MealAPI
//
//  Created by ? on 16/04/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            MealsList()
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("Meals")
                }
            SearchList()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            FavoriteMealsList()
                .tabItem {
                    Image(systemName: "bookmark.fill")
                    Text("Favorite")
                }
            
            Profile()
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("Creators")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
