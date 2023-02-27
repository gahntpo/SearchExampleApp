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
