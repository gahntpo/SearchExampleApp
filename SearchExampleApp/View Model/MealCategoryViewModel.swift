//
//  MealCategoryViewModel.swift
//  SearchExampleApp
//
//  Created by Karin Prater on 27.02.23.
//

import SwiftUI

class MealCategoryViewModel: ObservableObject {
    
    @Published private var meals = [Meal]()
    @Published var selectedCategory: MealCategory? = .oceanian
    @Published var selectedMeal: Meal? = nil
    
    @Published var searchText: String = ""
    
    var filteredMeals: [Meal] {
        guard selectedCategory != nil else { return [] }
        
        var results = mealsForSelectedCategory
        
        guard !searchText.isEmpty else { return results }
        
        return results.filter { meal in
            meal.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    var mealsForSelectedCategory: [Meal] {
        if let selectedCategory = selectedCategory {
            return meals.filter { $0.category == selectedCategory }
        } else {
            return meals
        }
    }
    
    private let service = DataService()
    
    init() {
        meals = service.loadMealsFromDataStorage()
    }
    
}
