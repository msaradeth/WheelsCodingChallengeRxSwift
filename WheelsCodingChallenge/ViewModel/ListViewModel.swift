//
//  ListViewModel.swift
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/2/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation

class ListViewModel {
    var items: [User]
    var stackApiService: StackApiService
    
    init(items: [User], stackApiService: StackApiService) {
        self.items = items
        self.stackApiService = stackApiService
    }
    
    subscript(index: Int) -> User {
        return items[index]
    }
    
    func loadData(completion: @escaping ([User]) -> Void) {
        stackApiService.loadData(completion: completion)
    }
    
}
