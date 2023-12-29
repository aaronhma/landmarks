//
//  ContentView.swift
//  Landmarks
//
//  Created by Aaron Ma on 12/9/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(ModelData.self) var modelData
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case favorites
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
                .tag(Tab.featured)
            
            FavoriteLandmarks()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
                .tag(Tab.favorites)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
