//
//  MealListViewModel.swift
//  SearchExampleApp
//
//  Created by Karin Prater on 27.02.23.
//

import Foundation

class MealListViewModel: ObservableObject {
    
    @Published var meals = [Meal]()
    
    private let service = DataService()
    
    init() {
        meals = service.loadMealsFromDataStorage()
    }
    
}
