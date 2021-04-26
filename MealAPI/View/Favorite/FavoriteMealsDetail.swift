//
//  FavoriteMealsDetail.swift
//  MealAPI
//
//  Created by ? on 21/04/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavoriteMealsDetail: View {
    
    let data : FavoriteMeal
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                WebImage(url: URL(string: data.wrappedThumb))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                
                VStack(alignment: .leading, spacing : 20){
                    Text(data.wrappedCategory)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(data.wrappedDesc)
                        .font(.body)
                }.padding()
            }
        }
    }
}

