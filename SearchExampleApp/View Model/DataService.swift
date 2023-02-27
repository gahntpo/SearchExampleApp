//
//  DataService.swift
//  SearchExampleApp
//
//  Created by Karin Prater on 27.02.23.
//

import Foundation

class DataService {
    
    func loadMealsFromDataStorage() -> [Meal]{
        var dbData = [Meal]()
        do {
            if let filePath  = Bundle.main.url(forResource: "DBdata", withExtension: "json") {
                
                let jsonData = try Data(contentsOf: filePath)
                let decodedData = try JSONDecoder().decode([Meal].self, from: jsonData)
                print("Decoded: \(decodedData)")
                dbData = decodedData
            } else {
                return [Meal]()
            }
        } catch let error {
            print("[System] Error while fetching: \(error)")
        }
        return dbData
    }
}
