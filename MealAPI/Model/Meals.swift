//
//  File.swift
//  MealAPI
//
//  Created by ? on 17/04/21.
//

import SwiftUI

struct Meals : Identifiable{
    var id = UUID()
    var category : String
    var thumb : String
    var description : String
}
