//
//  SearchCustomizeTokenMealListView.swift
//  SearchExampleApp
//
//  Created by Karin Prater on 27.02.23.
//

import SwiftUI

struct SearchCustomizeTokenMealListView: View {
    
    @StateObject var viewModel = CustomMealTokenListViewModel()
    
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
            .searchable(text: $viewModel.searchText,
                        tokens: $viewModel.selectedTokens, token: { token in
                Text(token.name)
            })
        }
    }
}

struct SearchCustomizeTokenMealListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCustomizeTokenMealListView()
    }
}

