//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Aaron Ma on 12/12/23.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData

    var body: some View {
        ForEach(modelData.landmarks) { landmark in
            NavigationLink {
                LandmarkDetail(landmark: landmark)
            } label: {
                LandmarkRow(landmark: landmark)
            }
        }
        .animation(.default, value: modelData.landmarks)
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
