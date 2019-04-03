//
//  UserDetailTableViewCell.swift
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/2/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

class UserDetailTableViewCell: UITableViewCell {
    static let cellIdentifier = "Cell"    
    @IBOutlet weak var textField: UITextField!

    func configure(item: TextFieldItem, row: Int) {
        textField.text = item.text
        textField.placeholder = item.placeHolder
        textField.keyboardType = item.keyboardType
        textField.tag = row
    }
}
