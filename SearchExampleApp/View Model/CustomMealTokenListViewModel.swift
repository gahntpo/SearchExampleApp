//
//  CustomMealTokenListViewModel.swift
//  SearchExampleApp
//
//  Created by Karin Prater on 27.02.23.
//

import SwiftUI
import Combine

struct StringToken: Identifiable {
    let name: String
    let id = UUID()
    
    static func testData() -> [StringToken] {
        ["Muffin", "Noodles", "Beef", "Wraps", "Hamburger", "Chicken",
                                     "Falafel", "Pita", "Avocado", "Tomato",
         "Chocolate", "Strawberry", "Coffee", "Cheese"].map {
            StringToken(name: $0)
        }
    }
}


class CustomMealTokenListViewModel: ObservableObject {

    @Published var meals = [Meal]()
    @Published var searchText: String = ""
    
    @Published var selectedTokens = [StringToken]()
    
    @Published private var commonTokens: [StringToken] = StringToken.testData()
    
    var subscriptions = Set<AnyCancellable>()
    
    var filteredMeals: [Meal] {
        var meals = self.meals
        
        if searchText.count > 0 {
            meals = meals.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
        
        if selectedTokens.count > 0 {
            let tokens = selectedTokens.map { $0.name }
            meals = meals.filter { $0.name.containsAll(tokens) }
        }
        
        return meals
    }
    
    private let service = DataService()
    
    init() {
        meals = service.loadMealsFromDataStorage()
 
       
        $searchText.filter({
            $0.last == " "
        })
        .filter({
            $0.count > 1
        })
        .sink { [unowned self] text in
            var filteredText = text
            
            for suggestion in commonTokens {
                if let range = filteredText.lowercased().range(of: suggestion.name.lowercased()) {
                    filteredText.removeSubrange(range)
                    filteredText.removeLast()
                    
                    DispatchQueue.main.async {
                        self.searchText = filteredText
                    }
                    
                    self.selectedTokens.append(suggestion)
                }
            }
        }
        .store(in: &subscriptions)
        
        
        $searchText.filter({
            $0.last == ","
        })
        .filter({
            $0.count > 1
        })
        .sink { text in
            var filteredText = text
            filteredText.removeLast() // remove ,
            
            self.selectedTokens.append(StringToken(name: filteredText))
            
            DispatchQueue.main.async {
                self.searchText = ""
            }
        }
        .store(in: &subscriptions)
    }
    
}


extension String {
    
    func containsAll(_ strings: [String]) -> Bool {
        var result = true
        
        for string in strings {
            if !self.localizedCaseInsensitiveContains(string) {
                result = false
            }
        }
        
        return result
    }
}
