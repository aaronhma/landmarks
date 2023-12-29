//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Aaron Ma on 12/9/23.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
