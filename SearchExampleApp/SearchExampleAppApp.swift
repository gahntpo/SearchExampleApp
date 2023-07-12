//
//  SearchExampleAppApp.swift
//  SearchExampleApp
//
//  Created by Karin Prater on 27.02.23.
//

import SwiftUI

@main
struct SearchExampleAppApp: App {
    var body: some Scene {
        WindowGroup {
            
            #if os(macOS)
            ThreeColumnView()
            #else
            
            TabView {
                SearchSuggestionMealListView()
                    .tabItem {
                        Text("old")
                    }
                UpdatedSearchSuggestionMealView()
                    .tabItem {
                        Text("new")
                    }
                
                SearchTokenMealListView()
                    .tabItem {
                        Text("token")
                    }
            }
            #endif
        }
    }
}
