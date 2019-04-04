//
//  ImageCache.swift
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/4/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import UIKit

@objcMembers
class ImageCache: NSObject {
    @objc static let shared = ImageCache()
    private var images: [String:UIImage] = [:]
    
    override init() {
        images["personPlaceholder"] = UIImage(named: "personPlaceholder")
    }
    
    @objc func get(id: String) -> UIImage? {
        return images[id]
    }
    @objc func set(id: String, image: UIImage) {
        images[id] = image
    }
}
