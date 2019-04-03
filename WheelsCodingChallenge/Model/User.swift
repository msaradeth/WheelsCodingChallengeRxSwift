//
//  User.swift
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/2/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation

struct UserService: Codable {
    var items: [User]
}
struct Badge: Codable {
    var bronze: Int
    var silver: Int
    var gold: Int
}

struct User: Codable {
    var name: String
    var urlString: String
    var reputation: Int
    var badge: Badge

    enum CodingKeys: String, CodingKey {
        case name = "display_name"
        case urlString = "profile_image"
        case reputation = "reputation"
        case badge = "badge_counts"
    }
}
