//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Aaron Ma on 12/12/23.
//

import SwiftUI

struct CategoryItem: View {
    @Environment(\.colorScheme) var colorScheme
    var landmark: Landmark

    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            
            HStack {
                Text(landmark.name)
                    .font(.caption)
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                
                FavoriteIcon(isSet: landmark.isFavorite)
                    .multilineTextAlignment(.trailing)
            }
        }
        .padding(.leading, 15)
    }
}

#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}
