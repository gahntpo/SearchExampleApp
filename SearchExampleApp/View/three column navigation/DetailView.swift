//
//  DetailView.swift
//  MyDelivery
//
//  Created by Karin Prater on 12.12.22.
//

import SwiftUI

struct DetailView: View {
    
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
 
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam at ante scelerisque, vehicula mi vitae, vulputate lacus. Mauris porttitor justo ac pulvinar ultrices. Quisque sed erat molestie ex consequat condimentum ac at est. Duis maximus nunc sed ipsum iaculis, ac ultrices magna fringilla. Pellentesque quis nulla justo. In pellentesque augue ullamcorper arcu volutpat aliquet. Duis iaculis tortor nec massa tincidunt, in cursus elit gravida. Vestibulum fringilla urna vel porta mattis. Etiam interdum blandit nulla. Cras pellentesque, risus vitae ultricies faucibus, quam turpis feugiat orci, id tempus mi metus vel purus. ")
                
                Spacer()
            }
            .padding(.horizontal, 15)
            #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
            #endif
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(meal: Meal.preview())
    }
}
