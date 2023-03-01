//
//  CardGroupBoxStyle.swift
//  SearchExampleApp
//
//  Created by Karin Prater on 27.02.23.
//

import SwiftUI

struct CardGroupBoxStyle: GroupBoxStyle {

    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            configuration.label
                .font(.title2)
            
            configuration.content

        }
        #if os(iOS)
        .background(Color(.tertiarySystemBackground))
        .cornerRadius(10)
        .shadow(radius: 5)
        #endif
      
        
    }
}

struct CardGroupBoxStyle_Previews: PreviewProvider {
    static var previews: some View {
        
        GroupBox {
            Text("CardGroupBoxStyle")
        }
        .groupBoxStyle( CardGroupBoxStyle())
       
    }
}
