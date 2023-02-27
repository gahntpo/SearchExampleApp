

import Foundation

enum MealCategory: String, Codable, CaseIterable, Identifiable, Hashable {
  
    case african = "African"
    case american = "American"
    case asian = "Asian"
    case europian = "Europian"
    case oceanian = "Oceanian"
    
    var id: String { rawValue }
}

extension MealCategory {
    enum ErrorType: Error {
        case encoding
        case decoding
    }
    
    init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer()
        let decodedValue = try value.decode(String.self)
        
        switch decodedValue {
        case "African":
            self = .african
        case "American":
            self = .american
        case "Asian":
            self = .asian
        case "Europian":
            self = .europian
        case "Oceanian":
            self = .oceanian
        default:
            print("Error occurs while decoding 'Food' key.")
            throw ErrorType.decoding
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var contrainer = encoder.singleValueContainer()
        
        switch self {
        case .african:
            try contrainer.encode("Afican")
        case .american:
            try contrainer.encode("American")
        case .asian:
            try contrainer.encode("Asian")
        case .europian:
            try contrainer.encode("Europian")
        case .oceanian:
            try contrainer.encode("Oceanian")

        }
    }
}
