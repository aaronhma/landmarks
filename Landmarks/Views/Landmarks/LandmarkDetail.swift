//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Aaron Ma on 12/12/23.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark
    @State private var rating: Int = 4
    @State private var isHiking: Bool = false
    var viewModel: LandmarkViewModel = LandmarkViewModel()

    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -150)
                .padding(.bottom, -160)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                ReviewLandmark(rating: $rating)
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                
                Text(landmark.description)
                    .padding(.bottom, 10)
                
                Divider()
                
                Text("Reported Trail Conditions")
                    .font(.title2)
                
                TrailConditionView(weather: "Sunny", icon: "sun.max.fill", info: "69°, 1hr ago")
                TrailConditionView(weather: "Easy - Moderate", icon: "mountain.2.fill", info: "Suggested difficulty")
            }
            .padding()
            
            HStack {
                Button {
                    isHiking.toggle()
                    
                    if isHiking {
                        viewModel.startTracking( name: landmark.name, park: landmark.park, state: landmark.state)
                    } else {
                        Task {
                            await viewModel.stopTracking()
                        }
                    }
                } label: {
                    StartHikingButton(isHiking: isHiking)
                }
            }
            .padding(.bottom, 15)
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let modelData = ModelData()
    
    return LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
}


struct TrailConditionView: View {
    var weather: String, icon: String, info: String
    
    var body: some View {
        HStack {
            Label(weather, systemImage: icon)
                .font(.headline)
            Text(info)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}
