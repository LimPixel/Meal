//
//  MealsList.swift
//  MealAPI
//
//  Created by ? on 17/04/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct MealsList: View {
    @ObservedObject var mealsViewModel = MealsViewModel()
    var body: some View {
        NavigationView{
            List(mealsViewModel.data){ item in
                NavigationLink(destination: MealsDetail(meals: item)){
                    HStack{
                        
                        // Jika fotonya ada
                        if item.thumb != ""{
                            WebImage(url: URL(string: item.thumb)!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 170)
                                .background(Image("loader")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 60, height: 30))
                                .cornerRadius(10)
                        }else{
                            Image("loader")
                                .resizable()
                                .frame(width: 120, height: 170)
                                .cornerRadius(10)
                        }
                        
                        VStack(alignment: .leading, spacing : 10){
                            Text(item.category).fontWeight(.bold)
                            
                            Text(item.description).font(.caption)
                                .lineLimit(4)
                                .multilineTextAlignment(.leading)
                        }
                    }
                }
            }.navigationBarTitle(Text("Meals"))
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MealsList_Previews: PreviewProvider {
    static var previews: some View {
        MealsList()
    }
}
