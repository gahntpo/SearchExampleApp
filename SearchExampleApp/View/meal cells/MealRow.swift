//
//  MealRow.swift
//  SearchExampleApp
//
//  Created by Karin Prater on 27.02.23.
//

import SwiftUI

struct MealRow: View {
    
    let meal: Meal
    
    var body: some View {
        VStack {
            Image(stringURL: meal.imageURL)
                .resizable()
                .scaledToFit()
            
            VStack {
                HStack {
                    Text(meal.name)
                        .font(.title)
                        .bold()
                    Spacer()
                    Text(meal.location)
                        .font(.subheadline)
                }
                .padding(.bottom, 1)
                
                HStack(spacing: 0) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text(String(meal.rating))
                        .padding(.trailing)
                    Text(meal.category.rawValue)
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.bottom, 1)
                
                HStack {
                    ForEach(meal.tags, id: \.self) { tag in
                        Text(tag)
                            .encapsulate(color: .black.opacity(0.8), foregroundColor : .white)
                    }
                    Spacer()
                }
                .padding(.bottom)
            }
            .padding(.horizontal, 15)
        }
    }
}

struct MealRow_Previews: PreviewProvider {
    static var previews: some View {
        MealRow(meal: Meal.preview())
    }
}
