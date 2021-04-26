//
//  Profile.swift
//  MealAPI
//
//  Created by ? on 17/04/21.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        VStack{
            Image("cloud")
                .resizable()
                .frame(width : 150.0, height: 150.0)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
            
            Text("Abdul Halim").font(.title).padding(.top, 16)
            Text("neonblackcat19@gmail.com").font(.body).padding(.top, 16)
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
 
