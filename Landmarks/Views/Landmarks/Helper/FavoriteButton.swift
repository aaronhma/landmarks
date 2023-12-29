//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Aaron Ma on 12/12/23.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool

    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            FavoriteIcon(isSet: isSet)
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
