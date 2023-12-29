//
//  SearchBox.swift
//  Landmarks
//
//  Created by Aaron Ma on 12/16/23.
//

import SwiftUI

struct SearchBox: View {
    var placeholder: String
    @State var searchText: String = ""
    
    var body: some View {
        HStack {
          Image(systemName: "magnifyingglass")
            .foregroundColor(.gray)

          TextField(placeholder, text: $searchText)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 32))
        .searchable(text: $searchText) {}
    }
}

#Preview {
    SearchBox(placeholder: "Find your next adventure...")
}
