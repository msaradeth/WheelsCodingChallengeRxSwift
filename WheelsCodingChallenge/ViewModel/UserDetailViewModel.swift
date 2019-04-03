//
//  UserDetailViewModel.swift
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/2/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import UIKit

struct TextFieldItem {
    var text: String?
    var placeHolder: String
    var keyboardType: UIKeyboardType
}

class UserDetailViewModel {
    var items: [TextFieldItem]
    var user: User {
        let badge = Badge.init(bronze: items[2].text?.intValue() ?? 0,
                               silver: items[3].text?.intValue() ?? 0,
                               gold: items[4].text?.intValue() ?? 0)
        let user = User.init(name: items[0].text ?? "",
                             urlString: "personPlaceholder",
                             reputation: items[1].text?.intValue() ?? 0,
                             badge: badge)
        return user
    }
    
    init(user: User?) {
        self.items = UserDetailViewModel.getItems(user: user)
    }
    
    private static func getItems(user: User?) -> [TextFieldItem] {
        //Build Array
        if let user = user {  //Update user
            let textItem = TextFieldItem(text: user.name, placeHolder: "Enter name", keyboardType: UIKeyboardType.namePhonePad)
            let reputationItem = TextFieldItem(text: user.reputation.stringValue(), placeHolder: "Enter reputation", keyboardType: UIKeyboardType.numberPad)
            let goldBadge = TextFieldItem(text: user.badge.gold.stringValue(), placeHolder: "Enter gold badge", keyboardType: UIKeyboardType.numberPad)
            let silverItem = TextFieldItem(text: user.badge.silver.stringValue(), placeHolder: "Enter silver badge", keyboardType: UIKeyboardType.numberPad)
            let bronzeItem = TextFieldItem(text: user.badge.bronze.stringValue(), placeHolder: "Enter bronze badge", keyboardType: UIKeyboardType.numberPad)
            let items = [textItem, reputationItem, goldBadge, silverItem, bronzeItem]
            return items
            
        }else { //Add new user
            let textItem = TextFieldItem(text: nil, placeHolder: "Enter name", keyboardType: UIKeyboardType.namePhonePad)
            let reputationItem = TextFieldItem(text: nil, placeHolder: "Enter reputation", keyboardType: UIKeyboardType.numberPad)
            let goldBadge = TextFieldItem(text: nil, placeHolder: "Enter gold badge", keyboardType: UIKeyboardType.numberPad)
            let silverItem = TextFieldItem(text: nil, placeHolder: "Enter silver badge", keyboardType: UIKeyboardType.numberPad)
            let bronzeItem = TextFieldItem(text: nil, placeHolder: "Enter bronze badge", keyboardType: UIKeyboardType.numberPad)
            let items = [textItem, reputationItem, goldBadge, silverItem, bronzeItem]
            
            return items
        }
    }
}



