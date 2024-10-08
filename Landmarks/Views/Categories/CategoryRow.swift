//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Aaron Ma on 12/12/23.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    
    @State private var showSearch: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(categoryName)
                    .font(.headline)
                    .padding(.leading, 15)
                    .padding(.top, 5)
                
                Button {
                    showSearch.toggle()
                } label: {
                    if showSearch {
                        SearchBox(placeholder: "Search all \(categoryName.lowercased())...")
                    } else {
                        Image(systemName: "magnifyingglass")
                    }
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    
    return CategoryRow(categoryName: landmarks[0].category.rawValue, items: Array(landmarks.prefix(4)))
}
