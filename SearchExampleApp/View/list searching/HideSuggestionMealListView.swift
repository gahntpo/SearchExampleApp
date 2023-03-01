//
//  HideSuggestionMealListView.swift
//  SearchExampleApp
//
//  Created by Karin Prater on 27.02.23.
//

import SwiftUI

struct HideSuggestionMealListView: View {
    
    @StateObject var viewModel = MealListViewModel()
    @State var selectedMeal: Meal? = nil
    
    var body: some View {
        NavigationSplitView(sidebar: {
            List(selection: $selectedMeal) {
                CustomSearchSuggestionView(viewModel: viewModel)
                
                ForEach(viewModel.filteredMeals) { meal in
                    MealCardView(meal: meal)
                        .tag(meal)
                }
                .listRowSeparator(.hidden, edges: .all)
            }
            .listStyle(.plain)
            .navigationTitle("Find Your Next Meal")
            
            .searchable(text: $viewModel.searchText, suggestions: {
                ForEach(viewModel.filteredSuggestions, id: \.self) { suggestion in
                    Text(suggestion)
                        .searchCompletion(suggestion)
                }
               .searchSuggestions(.hidden, for: .content)
            })
            
        }, detail: {
            if let meal = selectedMeal {
                DetailView(meal: meal)
            } else {
                Text("Select a Meal")
            }
        })
    }
}

struct CustomSearchSuggestionView: View {
    
    @ObservedObject var viewModel: MealListViewModel
    @Environment(\.searchSuggestionsPlacement) var placement
    
    var body: some View {
        if placement == .content {
            ForEach(viewModel.filteredSuggestions, id: \.self) { suggestion in
                Button {
                    viewModel.searchText = suggestion
                } label: {
                    Label(suggestion, systemImage: "bookmark")
                }
            }
            
        }
    }
}

struct HideSuggestionMealListView_Previews: PreviewProvider {
    static var previews: some View {
        HideSuggestionMealListView()
    }
}
