//
//  MealListView.swift
//  SearchExampleApp
//
//  Created by Karin Prater on 27.02.23.
//

import SwiftUI

struct MealListContentView: View {
    
    @Binding var selectedMeal: Meal?
    let meals: [Meal]
    
    var body: some View {
        List(selection: $selectedMeal) {
            ForEach(meals) { meal in
                MealCardView(meal: meal)
                    .tag(meal)
            }
            .listRowSeparator(.hidden, edges: .all)
            .listRowInsets(.init(top: 10, leading: 10,
                                 bottom: 10, trailing: 10))
        }
        .listStyle(.plain)
        .navigationTitle("Find Your Next Meal")
        
    }
}


struct MealListContentView_Previews: PreviewProvider {
    static var previews: some View {
        MealListContentView(selectedMeal: .constant(nil), meals: [Meal.preview()])
    }
}
