//
//  LandmarkWidgetAttributes.swift
//  Landmarks
//
//  Created by Aaron Ma on 12/16/23.
//

import Foundation
import ActivityKit

struct LandmarkWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var currentElevation: Float
        var changeElevation: Float
    }

    var name = ""
    var park = ""
    var state = ""
}
