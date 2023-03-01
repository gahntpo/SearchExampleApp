//
//  SearchScopeMealListView.swift
//  SearchExampleApp
//
//  Created by Karin Prater on 27.02.23.
//


import SwiftUI

struct SearchScopeMealListView: View {
    
    @StateObject var viewModel = MealTokenListViewModel()
    @State var selectedMeal: Meal? = nil
    
    var body: some View {
        NavigationSplitView(sidebar: {
            List(selection: $selectedMeal) {
                ForEach(viewModel.filteredMeals) { meal in
                   MealCardView(meal: meal)
                        .tag(meal)
                }
                .listRowSeparator(.hidden, edges: .all)
            }
            .listStyle(.plain)
            .navigationTitle("Find Your Next Meal")
        }, detail: {
            if let meal = selectedMeal {
                DetailView(meal: meal)
            } else {
                Text("Select a Meal")
            }
        })
        //.searchable(text: $viewModel.searchText)
        .searchable(text: $viewModel.searchText,
                    tokens: $viewModel.selectedTokens,
                    suggestedTokens: $viewModel.suggestedTokens,
                    token: { token in
            Text(token.rawValue)
        })
        .searchScopes($viewModel.mealSearchScope, scopes: {
            Text("All").tag(MealSearchScope.all)
            
            ForEach(MealCategory.allCases) { category in
                Text(category.rawValue).tag(MealSearchScope.category(category))
            }
        })
    }
}





struct SearchScopeMealListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchScopeMealListView()
    }
}
