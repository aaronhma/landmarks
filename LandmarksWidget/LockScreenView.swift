//
//  LockScreenView.swift
//  Landmarks
//
//  Created by Aaron Ma on 12/16/23.
//

import SwiftUI
import WidgetKit

struct LockScreenView: View {
    
    var context: ActivityViewContext<LandmarkWidgetAttributes>
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(context.attributes.name)
                    .font(.title2)
                    .bold()
                
                Text(context.attributes.park)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            PercentView(context: context)
                .padding()
        }
        .padding()
    }
}
