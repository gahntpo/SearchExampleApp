//
//  SearchSuggestionMealListView.swift
//  SearchExampleApp
//
//  Created by Karin Prater on 27.02.23.
//

import SwiftUI

struct SearchSuggestionMealListView: View {
    
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
            
            .searchable(text: $viewModel.searchText, suggestions: {
                ForEach(viewModel.filteredSuggestions, id: \.self) { suggestion in
                    /*
                    Button {
                        viewModel.searchText = suggestion
                    } label: {
                        Label(suggestion, systemImage: "bookmark")
                    }
                     */
                    Text(suggestion)
                        .searchCompletion(suggestion)
                }
            })
        }
    }
}

struct SearchSuggestionMealListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchSuggestionMealListView()
    }
}
