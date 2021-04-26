//
//  FavoriteMeal+CoreDataProperties.swift
//  MealAPI
//
//  Created by ? on 21/04/21.
//
//

import Foundation
import CoreData


extension FavoriteMeal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteMeal> {
        return NSFetchRequest<FavoriteMeal>(entityName: "FavoriteMeal")
    }

    @NSManaged public var category: String?
    @NSManaged public var desc: String?
    @NSManaged public var id: UUID?
    @NSManaged public var thumb: String?
    
    public var wrapppedId : UUID?{
        id
    }
    
    public var wrappedCategory : String{
        category ?? "Unknown category"
    }
    
    public var wrappedDesc : String{
        desc ?? "Unknown description"
    }
    
    public var wrappedThumb : String{
        thumb ?? "unknown thumbnail"
    }


}

extension FavoriteMeal : Identifiable {

}
