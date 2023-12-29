//
//  FavoriteIcon.swift
//  Landmarks
//
//  Created by Aaron Ma on 12/13/23.
//

import SwiftUI

struct FavoriteIcon: View {
    var isSet: Bool
    
    var body: some View {
        Label("Toggle Favorites", systemImage: isSet ? "heart.fill" : "heart")
            .labelStyle(.iconOnly)
            .foregroundStyle(isSet ? Color(hue: 0, saturation: 0.5, brightness: 0.7) : .gray)
    }
}

#Preview {
    Group {
        FavoriteIcon(isSet: false)
        FavoriteIcon(isSet: true)
    }
}
