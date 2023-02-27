//
//  ThreeColumnView.swift
//  MyDelivery
//
//  Created by Karin Prater on 12.12.22.
//

import SwiftUI

struct ThreeColumnView: View {
    
    @StateObject var viewModel = MealCategoryViewModel()
    @State private var columnVisibility: NavigationSplitViewVisibility = .all
    
    var body: some View {
        
        NavigationSplitView(columnVisibility: $columnVisibility) {
            SidebarView(selectedCategory: $viewModel.selectedCategory)
        } content: {
            ContentView(meals: viewModel.mealsForSelectedCategory,
                        selectedMeal: $viewModel.selectedMeal)
        } detail: {
            if let meal = viewModel.selectedMeal {
                DetailView(meal: meal)
            } else {
                Text("Detail")
            }
        }
    }
}



struct ThreeColumnView_Previews: PreviewProvider {
    static var previews: some View {
        ThreeColumnView()
    }
}
