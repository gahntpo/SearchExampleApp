//
//  PromptMealListView.swift
//  SearchExampleApp
//
//  Created by Karin Prater on 27.02.23.
//

import SwiftUI

struct PromptMealListView: View {
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
            
            .searchable(text: $viewModel.searchText, prompt: "Search for Meals")
        }
    }
}

struct PromptMealListView_Previews: PreviewProvider {
    static var previews: some View {
        PromptMealListView()
    }
}
