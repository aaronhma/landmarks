//
//  StartHikingButton.swift
//  Landmarks
//
//  Created by Aaron Ma on 12/16/23.
//

import SwiftUI

struct StartHikingButton: View {
    var isHiking: Bool
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Label(isHiking ? "End Hike" : "Begin Hike", systemImage: isHiking ? "star.fill" : "figure.walk")
            .symbolEffect(.bounce, value: isHiking)
            .frame(width: 200, height: 50)
            .background(isHiking ? (Color(hue: 0, saturation: 0.5, brightness: 0.7)) : (colorScheme == .dark ? .white : .black))
            .foregroundStyle(colorScheme == .dark ? (isHiking ? .white : .black) : .white)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
}

#Preview {
    Group {
        StartHikingButton(isHiking: false)
        StartHikingButton(isHiking: true)
    }
}
