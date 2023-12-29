//
//  LandmarksWidgetLiveActivity.swift
//  LandmarksWidget
//
//  Created by Aaron Ma on 12/16/23.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct LandmarksWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: LandmarkWidgetAttributes.self) { context in
            LockScreenView(context: context)

        } dynamicIsland: { context in
            DynamicIsland {
                let color = context.state.changeElevation < 0 ? Color.red : Color.green

                DynamicIslandExpandedRegion(.leading) {
                    Image(systemName: "figure.walk")
                        .font(.title)
                        .bold()
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Elevation:")
                    
                    Text("\(context.state.changeElevation, specifier: "%.2f") ft")
                        .foregroundStyle(color)
                        .font(.title3)
                        .bold()
                }
                DynamicIslandExpandedRegion(.bottom) {
                    HStack {
                        VStack {
                            Text(context.attributes.name)
                            Text(context.attributes.park)
                                .foregroundStyle(.secondary)
                            
                            Text(context.attributes.state)
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                        PercentView(context: context)
                    }
                    .font(.title3)
                    .bold()
                }
            } compactLeading: {
                Image(systemName: "figure.walk")
                    .font(.title)
                    .bold()
                    .foregroundStyle(context.state.changeElevation < 0 ? Color.red : Color.green)
            } compactTrailing: {
                PercentView(context: context)
            } minimal: {
                PercentView(context: context)
            }
        }
    }
}
