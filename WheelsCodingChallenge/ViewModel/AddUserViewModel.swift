//
//  AddUserViewModel.swift
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/2/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import RxSwift


class AddUserViewModel {
    var subject: BehaviorSubject<User>
    var user: User
    
    init(user: User) {
        self.user = user
        subject = BehaviorSubject<User>(value: user)
    }    
}
