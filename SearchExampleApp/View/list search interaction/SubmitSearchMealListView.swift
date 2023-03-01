//
//  SubmitSearchMealListView.swift
//  SearchExampleApp
//
//  Created by Karin Prater on 27.02.23.
//

import SwiftUI

struct SubmitSearchMealListView: View {
    @StateObject var viewModel = MealListViewModel()
    @State var selectedMeal: Meal? = nil
    
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
            
            .onSubmit(of: .search) {
                print("fetch data from server to refresh with full search query")
                // viewModel.performQuery()
            }
        }
    }
}

struct SubmitSearchMealListView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitSearchMealListView()
    }
}


