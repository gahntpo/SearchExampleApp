//
//  MealListViewModel.swift
//  SearchExampleApp
//
//  Created by Karin Prater on 27.02.23.
//

import Foundation

class MealListViewModel: ObservableObject {
    
    @Published var meals = [Meal]()
    @Published var searchText: String = ""
    
    var filteredMeals: [Meal] {
        guard !searchText.isEmpty else { return meals }
        return meals.filter { meal in
            meal.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    @Published var suggestions = ["Muffin", "Noodles", "Beef", "Wraps", "Hamburger", "Chicken",
                                  "Falafel", "Pita", "Avocado", "Tomato",
                                  "Chocolate", "Strawberry", "Coffee"]
    
    var filteredSuggestions: [String] {
        guard !searchText.isEmpty else { return [] }
        return suggestions.sorted().filter { $0.lowercased().contains(searchText.lowercased()) }
    }
    
    private let service = DataService()
    
    init() {
        meals = service.loadMealsFromDataStorage()
    }

}
