//
//  FavoriteMealsList.swift
//  MealAPI
//
//  Created by ? on 21/04/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavoriteMealsList: View {
    
    @Environment (\.managedObjectContext) var moc
    @FetchRequest(entity: FavoriteMeal.entity(), sortDescriptors: []) var favoriteMeals: FetchedResults<FavoriteMeal>
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(favoriteMeals, id : \.self){ item in
                        NavigationLink(destination: FavoriteMealsDetail(data: item)){
                            HStack{
                                // Jika Fotonya ada
                                if item.thumb != ""{
                                    WebImage(url: URL(string: item.wrappedThumb)!)
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
                                
                                VStack(alignment: .leading, spacing: 10){
                                    Text(item.wrappedCategory).fontWeight(.bold)
                                    
                                    Text(item.wrappedDesc).font(.caption)
                                        .lineLimit(4)
                                        .multilineTextAlignment(.leading)
                                }
                            }
                        }
                    }.onDelete(perform: deleteMealsList)
                }
            }.navigationBarTitle(Text("Favorite Meals"))
        }
    }
    
    private func deleteMealsList(at offset : IndexSet){
        for index in offset{
            let favorite = favoriteMeals[index]
            moc.delete(favorite)
            
            do{
                try moc.save()
            }catch{
                print(error)
            }
        }
    }
}


struct FavoriteMealsList_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteMealsList()
    }
}
