//
//  SearchViewModel.swift
//  MealAPI
//
//  Created by ? on 23/04/21.
//

import SwiftUI
import SwiftyJSON

class SearchViewModel: ObservableObject {
    
    @Published var search = ""
    @Published var meals : [Meals] = []
    @Published var mealsFiltered : [Meals] = []
    
    func filterMeals(){
        withAnimation(){
            self.mealsFiltered = self.meals.filter{
                return $0.category.lowercased().contains(self.search.lowercased())
            }
        }
    }
    
    init() {
        let url = "---API KEY---"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, _, error) in
            if error != nil{
                print((error?.localizedDescription)!)
                return
            }
            
            let json = try! JSON(data : data!)
            let items = json["categories"].array!
            
            for i in items{
                let category = i["strCategory"].stringValue
                let description = i["strCategoryDescription"].stringValue
                let image = i["strCategoryThumb"].stringValue
                
                DispatchQueue.main.async {
                    self.meals.append(Meals(category: category, thumb: image, description: description))
                }
            }
        }.resume()
    }

}
