//
//  UpdatedSearchSuggestionMealView.swift
//  SearchExampleApp
//
//  Created by Karin Prater on 27.02.23.
//

import SwiftUI

struct UpdatedSearchSuggestionMealView: View {
    
    @StateObject var viewModel = MealListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.filteredMeals) { meal in
                   MealCardView(meal: meal)
                }
                .listRowSeparator(.hidden, edges: .all)
            }
            .listStyle(.plain)
            .navigationTitle("Find Your Next Meal")
            
            .searchable(text: $viewModel.searchText)
            .searchSuggestions {
                ForEach(viewModel.filteredSuggestions, id: \.self) { suggestion in
                    Text(suggestion)
                        .searchCompletion(suggestion)
                }
            }
        }
    }
}


struct UpdatedSearchSuggestionMealView_Previews: PreviewProvider {
    static var previews: some View {
        UpdatedSearchSuggestionMealView()
    }
}
