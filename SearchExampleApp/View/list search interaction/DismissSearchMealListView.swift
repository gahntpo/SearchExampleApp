//
//  DismissSearchMealListView.swift
//  SearchExampleApp
//
//  Created by Karin Prater on 27.02.23.
//

import SwiftUI

struct DismissSearchMealListView: View {
    
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
    
    @Environment(\.isSearching) var isSearching
    @Environment(\.dismissSearch) var dismissSearch
    
    @ObservedObject var viewModel: MealListViewModel
    @Binding var selectedMeal: Meal?
    
    var body: some View {
        MealListContentView(selectedMeal: $selectedMeal,
                            meals: viewModel.meals)
            .overlay {
                if isSearching && !viewModel.searchText.isEmpty {
                    VStack {
                        HStack {
                            Text("Search Results")
                         
                            Button("Done") {
                                dismissSearch()
                            }
                        }
                        MealListContentView(selectedMeal: $selectedMeal,
                                            meals: viewModel.filteredMeals)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color("background"))
                }
            }
    }
}

struct DismissSearchMealListView_Previews: PreviewProvider {
    static var previews: some View {
        DismissSearchMealListView()
    }
}
