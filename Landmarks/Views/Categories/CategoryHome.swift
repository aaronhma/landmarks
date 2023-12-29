//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Aaron Ma on 12/12/23.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false

    var body: some View {
        NavigationSplitView {
            List {
                SearchBox(placeholder: "Find your next adventure...")
                
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .listRowInsets(EdgeInsets())
                
                ScrollView {
                    VStack {                        ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                            CategoryRow(categoryName: key, items: modelData.categories[key]!)
                        }
                        .listRowInsets(EdgeInsets())
                    }
                }
                
                LandmarkList()
            }
            .listStyle(.inset)
            .navigationTitle("Explore")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingProfile.toggle()
                    } label: {
                        Label("User Profile", systemImage: "person.crop.circle")
                    }
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environment(modelData)
            }
        } detail: {
            Text("Select a landmark.")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
