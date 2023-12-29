//
//  FavoriteLandmarks.swift
//  Landmarks
//
//  Created by Aaron Ma on 12/13/23.
//

import SwiftUI

struct FavoriteLandmarks: View {
    @Environment(ModelData.self) var modelData

    var favoriteLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            landmark.isFavorite
        }
    }
    
    var body: some View {
        NavigationSplitView {
            if favoriteLandmarks.isEmpty {
                HStack(alignment: .center) {
                    Text("Build your favorite landmarks list.")
                        .font(.title)
                        .navigationTitle("Favorites")
                }
            } else {
                List {
                    ForEach(favoriteLandmarks) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                    .navigationTitle("Favorites")
                    .animation(.default, value: favoriteLandmarks)
                }
            }
        } detail: {
            Text("Choose a landmark.")
        }
    }
}

#Preview {
    FavoriteLandmarks()
        .environment(ModelData())
}

