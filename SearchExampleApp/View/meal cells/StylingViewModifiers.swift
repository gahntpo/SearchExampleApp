//
//  StylingViewModifiers.swift
//  MyDelivery
//
//  Created by Karin Prater on 12.12.22.
//

import SwiftUI

extension View {
    func encapsulate(color: Color, foregroundColor: Color = .black) -> some View {
        return self
            .padding(7)
            .padding(.horizontal, 5)
            .background(Capsule().fill(color))
            .foregroundColor(foregroundColor)
    }
    
    func encapsulate(borderColor: Color) -> some View {
        return self
            .padding(7)
            .padding(.horizontal, 5)
            .overlay(Capsule().stroke(borderColor))
    }
}
