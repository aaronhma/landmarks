//
//  Profile.swift
//  Landmarks
//
//  Created by Aaron Ma on 12/12/23.
//

import Foundation

struct Profile {
    var username: String
    var tag: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "Aaron", tag: "aaron")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷 Spring"
        case summer = "🌞 Summer"
        case autumn = "🍂 Fall"
        case winter = "☃️ Winter"
        
        var id: String { rawValue }
    }
}
