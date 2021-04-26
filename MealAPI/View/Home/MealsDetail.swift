//
//  MealsDetail.swift
//  MealAPI
//
//  Created by ? on 17/04/21.
//

import SwiftUI
import SDWebImageSwiftUI


struct MealsDetail: View {
    
    @Environment (\.managedObjectContext) var moc
    @FetchRequest(entity: FavoriteMeal.entity(), sortDescriptors: []) var favoriteMeals: FetchedResults<FavoriteMeal>
    
    let meals : Meals
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                WebImage(url: URL(string: meals.thumb))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 20){
                    Text(meals.category)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(meals.description)
                        .font(.body)
                    
                    HStack(alignment: .center){
                        if(checkId(id: meals.id) == true){
                            Button(action: {
                                self.deleteFavoriteMeals(id: meals.id)
                                try? self.moc.save()
                            }){
                                HStack{
                                    Image(systemName: "trash").foregroundColor(.red)
                                    Text("Delete from favorite").foregroundColor(.red)
                                }.padding(7)
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.red, lineWidth: 2))
                            }
                        }else{
                            Button(action: {
                                self.addFavoriteMeals(data: meals)
                                try? self.moc.save()
                            }){
                                HStack{
                                    Image(systemName: "heart").foregroundColor(.blue)
                                    Text("Add to favorite").foregroundColor(.blue)
                                }.padding(7)
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 2)
                                )
                            }
                        }
                    }
                }.padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func checkId(id : UUID)-> Bool{
        for meals in favoriteMeals{
            if meals.wrapppedId == id {
                return true
            }
        }
        return false
    }
    
    private func deleteFavoriteMeals(id : UUID){
        for meals in favoriteMeals{
            if meals.wrapppedId == id{
                moc.delete(meals)
            }
        }
    }
    
    private func addFavoriteMeals(data : Meals){
        let favorite = FavoriteMeal(context: self.moc)
        favorite.id = data.id
        favorite.category = data.category
        favorite.thumb = data.thumb
        favorite.desc = data.description
    }
    
}

struct MealsDetail_Previews: PreviewProvider {
    static var previews: some View {
        MealsDetail(meals: Meals(category: "", thumb: "", description: ""))
    }
}
