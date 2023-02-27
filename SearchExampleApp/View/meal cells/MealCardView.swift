//
//  MealCardView.swift
//  SearchExampleApp
//
//  Created by Karin Prater on 27.02.23.
//

import SwiftUI

struct MealCardView: View {
    let meal: Meal
    
    var body: some View {
        GroupBox {
            Image(stringURL: meal.imageURL)
                .resizable()
                .scaledToFill()
                .frame(height: 150)
                .clipped()
            
            VStack {
                HStack {
                    Text(meal.name)
                        .font(.title2)
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
        .groupBoxStyle(CardGroupBoxStyle())
    }
}



struct MealCardView_Previews: PreviewProvider {
    static var previews: some View {
        MealCardView(meal: Meal.preview())
            .padding()
    }
}
