//
//  PercentView.swift
//  Landmarks
//
//  Created by Aaron Ma on 12/16/23.
//

import SwiftUI
import WidgetKit

struct PercentView: View {
    var context: ActivityViewContext<LandmarkWidgetAttributes>
    
    var body: some View {
        
        let color = context.state.changeElevation < 0 ? Color.red : Color.green
        
        ProgressView(value: abs(context.state.changeElevation), total: 100) {
            context.state.changeElevation < 0 ?
                      Image(systemName: "arrowshape.down.fill") :
                                  Image(systemName: "arrowshape.up.fill")
        }
        .progressViewStyle(.circular)
        .tint(color)
        .foregroundColor(color)
    }
}
