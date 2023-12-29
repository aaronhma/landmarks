//
//  ReviewLandmark.swift
//  Landmarks
//
//  Created by Aaron Ma on 12/15/23.
//

import SwiftUI

struct ReviewLandmark: View {
    @Binding var rating: Int
    private let maxRating = 5
    
    var body: some View {
        HStack {
            ForEach(1...maxRating, id: \.self) { value in
                Image(systemName: "star")
                    .symbolVariant(value <= rating ? .fill : .none)
                    .foregroundStyle(.blue)
                    .onTapGesture {
                        if value != rating {
                            rating = value
                        } else {
                            rating = 0
                        }
                    }
            }
        }
    }
}

#Preview {
    @State var rating = 4
    return ReviewLandmark(rating: $rating)
}
