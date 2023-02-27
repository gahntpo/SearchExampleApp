//
//  ContentView.swift
//  MyDelivery
//
//  Created by Karin Prater on 12.12.22.
//

import SwiftUI

struct ContentView: View {
    
    let meals: [Meal]
    @Binding var selectedMeal: Meal?
    
    var body: some View {
        List(selection: $selectedMeal) {
            ForEach(meals) { meal in
                #if os(iOS)
                MealCardView(meal: meal)
                    .tag(meal)
                    .listRowInsets(.init(top: 0, leading: 10, bottom: 10, trailing: 10))
                #else
                MealRow(meal: meal)
                    .tag(meal)
                #endif
                    
            }
            .listRowSeparator(.hidden, edges: .all)
            
        }
        .listStyle(.plain)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(meals: [Meal.preview()],
                    selectedMeal: .constant(nil))
        .listStyle(.plain)
    }
}
