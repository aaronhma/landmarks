//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Aaron Ma on 12/12/23.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                
                Text(landmark.park)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            FavoriteIcon(isSet: landmark.isFavorite)
        }
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    
    return Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}
