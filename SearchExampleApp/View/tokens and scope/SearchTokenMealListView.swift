//
//  SearchTokenMealListView.swift
//  SearchExampleApp
//
//  Created by Karin Prater on 27.02.23.
//

import SwiftUI

struct SearchTokenMealListView: View {
    
    @StateObject var viewModel = MealTokenListViewModel()
    
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
                        tokens: $viewModel.selectedTokens,
                        suggestedTokens: $viewModel.suggestedTokens,
                        token: { token in
                Label(token.rawValue, systemImage: token.icon())
                    .encapsulate(color: Color.cyan,
                                 foregroundColor: .white)
            })
        }
    }
}




struct SearchTokenMealListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTokenMealListView()
    }
}
