//
//  SearchVisibilityMealListView.swift
//  SearchExampleApp
//
//  Created by Karin Prater on 27.02.23.
//

import SwiftUI

struct SearchVisibilityMealListView: View {
    
    @StateObject var viewModel = MealListViewModel()
    @State var selectedMeal: Meal? = nil
    
    var placement: SearchFieldPlacement {
        #if os(iOS)
        //.navigationBarDrawer(displayMode:.always)
        .toolbar
        #else
        .toolbar
        #endif
    }
    
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
            Group {
                if let meal = selectedMeal {
                    DetailView(meal: meal)
                } else {
                    Text("Select a Meal")
                }
            }
           // .searchable(text: $viewModel.searchText,
           //             placement: placement)
        })
        

      //  .searchable(text:  $viewModel.searchText, placement: .sidebar)
        
        .searchable(text: $viewModel.searchText,
                    placement: placement)
       
    }
}

struct SearchVisibilityMealListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchVisibilityMealListView()
    }
}
