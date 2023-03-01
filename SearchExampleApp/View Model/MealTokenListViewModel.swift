//
//  MealTokenListViewModel.swift
//  SearchExampleApp
//
//  Created by Karin Prater on 27.02.23.
//

import Foundation

enum MealSearchToken: String, Hashable, CaseIterable, Identifiable {
    case fourStarReview = "4+ star review"
    case onSale = "On sale"
    case toGo = "To go"
    case coupon = "coupon"
    
    var id: String { rawValue }
    
    func icon() -> String {
        switch self {
            case .fourStarReview:
               return "star"
            case .onSale:
               return "paperplane"
            case .toGo:
               return "figure.walk"
            case .coupon:
               return "tag"
        }
    }
}

enum MealSearchScope: Hashable {
    case all
    case category(MealCategory)
}

class MealTokenListViewModel: ObservableObject {
    
    
    @Published var meals = [Meal]()
    @Published var searchText: String = ""
    
    @Published var selectedTokens = [MealSearchToken]()
    @Published var suggestedTokens = MealSearchToken.allCases
    
    @Published var mealSearchScope: MealSearchScope = .all

    var filteredMeals: [Meal] {
        var meals = self.meals
        
        switch mealSearchScope {
            case .all: break
            case .category(let category):
                meals = meals.filter { $0.category == category }
        }
        
        if searchText.count > 0 {
            meals = meals.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
        
        for token in selectedTokens {
            switch token {
                case .fourStarReview:
                    meals = meals.filter({ $0.rating >= 4 })
                case .onSale, .coupon, .toGo:
                    meals = meals.filter({ $0.containsTag(token.rawValue)})
            }
        }
        
        return meals
    }

    
    private let service = DataService()
    
    init() {
        meals = service.loadMealsFromDataStorage()
    }
}
