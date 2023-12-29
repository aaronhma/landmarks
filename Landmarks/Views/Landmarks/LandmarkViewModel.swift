//
//  LandmarkViewModel.swift
//  Landmarks
//
//  Created by Aaron Ma on 12/16/23.
//

import Foundation
import ActivityKit
import WidgetKit

@Observable
class LandmarkViewModel {
    
    private var activity: Activity<LandmarkWidgetAttributes>?
    private var timer: Timer?
    private var oldPrice: Float = 100
    var currentElevation: Float = 100
    var changeElevation: Float = 0
    
    func startTracking(name: String, park: String, state: String) {
        let contentState = LandmarkWidgetAttributes.ContentState(
            currentElevation: currentElevation, changeElevation: changeElevation)
        var attributes = LandmarkWidgetAttributes()
        attributes.name = name
        attributes.park = park
        attributes.state = state
        
        do {
            activity = try Activity.request(
                attributes: attributes,
                content: .init(state: contentState, staleDate: nil),
                pushType: nil
            )
            update()
        } catch (let error) {
            print("Error starting Live Activity: \(error.localizedDescription).")
        }
    }
    
    private func update() {
        let priceStatus = LandmarkWidgetAttributes.ContentState(currentElevation: currentElevation, changeElevation: changeElevation)
            
        Task {
            var alertConfig: AlertConfiguration? = nil
            alertConfig = AlertConfiguration(
                title: "Elevation Change!",
                body: "Elevation has changed.",
                sound: .default
            )
            
            await activity?.update(
                ActivityContent<LandmarkWidgetAttributes.ContentState>(
                    state: priceStatus,
                    staleDate: nil,
                    relevanceScore: 0
                ),
                alertConfiguration: alertConfig
            )
        }
    }
    
    
    func stopTracking() async {
        let finalState = LandmarkWidgetAttributes.ContentState(currentElevation: currentElevation, changeElevation: changeElevation)
        timer?.invalidate()
        await activity?.end(.init(state: finalState, staleDate: nil),
                dismissalPolicy: .default)
    }
}
