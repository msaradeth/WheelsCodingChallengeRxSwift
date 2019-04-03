//
//  Cache.swift
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/2/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import UIKit

class Cache: NSObject {
    static let shared = Cache()
    
    var image: [String:UIImage] = [:]
    
    override init() {
        image["personPlaceholder"] = UIImage(named: "personPlaceholder")
    }
}
