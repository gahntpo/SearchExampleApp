import SwiftUI

struct Meal: Codable, Hashable, Identifiable {
    let imageURL: String
    let id: String
    let category: MealCategory
    let name: String
    let location: String
    let rating: Double
    var tags: [String]
    
    enum CodingKeys: String, CodingKey {
        case imageURL, name, location, rating, tags, id
        case category = "food"
    }
    
    static func preview() -> Meal {
        Meal(imageURL: "europian.jpg",
             id: "3",
             category: MealCategory.oceanian,
             name: "food name",
             location: "Africa",
             rating: 4,
             tags: ["Fast Food"])
    }
    
}

extension Meal {
    func containsTag(_ tag: String) -> Bool {
        tags.first { $0 == tag } != nil
    }
}

