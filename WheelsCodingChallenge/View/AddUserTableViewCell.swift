//
//  AddUserTableViewCell.swift
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/2/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

class AddUserTableViewCell: UITableViewCell {
    static let cellIdentifier = "Cell"
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var reputation: UITextField!
    @IBOutlet weak var goldBadge: UITextField!
    @IBOutlet weak var silvelBadge: UITextField!
    @IBOutlet weak var bronzeBadge: UITextField!
        
    func configure(item: User) {
//        name.text = item.name
//        reputation.text = String(item.reputation)
//        goldBadge.text = String(item.badge.gold)
//        silvelBadge.text = String(item.badge.silver)
//        bronzeBadge.text = String(item.badge.bronze)
    }
}
