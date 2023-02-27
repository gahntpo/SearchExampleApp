//
//  MealListView.swift
//  SearchExampleApp
//
//  Created by Karin Prater on 27.02.23.
//

import SwiftUI

struct MealListView: View {
    
    @StateObject var viewModel = MealListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.meals) { meal in
                   MealCardView(meal: meal)
                }
                .listRowSeparator(.hidden, edges: .all)
                .listRowInsets(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            }
            .listStyle(.plain)
            .navigationTitle("Find Your Next Meal")
        }
    }
}

struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}
