//
//  File.swift
//  MealAPI
//
//  Created by ? on 17/04/21.
//

import SwiftUI
import Combine
import SwiftyJSON

class MealsViewModel: ObservableObject {
    @Published var data = [Meals]()
    
    init() {
        let url = "--- API KEY ---"
        
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
                    self.data.append(Meals(category: category, thumb: image, description: description))
                }
            }
        }.resume()
    }
}
