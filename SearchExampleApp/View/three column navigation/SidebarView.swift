//
//  SidebarView.swift
//  MyDelivery
//
//  Created by Karin Prater on 12.12.22.
//

import SwiftUI

struct SidebarView: View {
    
    @Binding var selectedCategory: MealCategory?
    let categories = MealCategory.allCases
    
    var body: some View {
        List(selection: $selectedCategory) {
            
            ForEach(categories, id: \.self) { store in
              
                Text(store.rawValue)
                    .tag(store)
            }
           
        }
        //.listStyle(.sidebar)
        .navigationTitle("Order Your next Meal")
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView(selectedCategory: .constant(.oceanian))
    }
}
