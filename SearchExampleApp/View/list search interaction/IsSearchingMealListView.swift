//
//  IsSearchingMealListView.swift
//  SearchExampleApp
//
//  Created by Karin Prater on 27.02.23.
//

import SwiftUI

struct IsSearchingMealListView: View {
    
    @StateObject var viewModel = MealListViewModel()
    @State var selectedMeal: Meal? = nil
    
    var body: some View {
        NavigationStack {
            MealSearchListView(viewModel: viewModel,
                                 selectedMeal: $selectedMeal)
                .searchable(text: $viewModel.searchText)
        }
    }
}


private struct MealSearchListView: View {
    
    @ObservedObject var viewModel: MealListViewModel
    @Environment(\.isSearching) var isSearching
    @Binding var selectedMeal: Meal?
    
    var body: some View {
        MealListContentView(selectedMeal: $selectedMeal,
                            meals: viewModel.meals)
            .overlay {
                if isSearching && !viewModel.searchText.isEmpty {
                    VStack {
                        Text("Search Results")
                        MealListContentView(selectedMeal: $selectedMeal,
                                            meals: viewModel.filteredMeals)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color("background"))
                }
            }
    }
}

struct IsSearchingMealListView_Previews: PreviewProvider {
    static var previews: some View {
        IsSearchingMealListView()
    }
}
