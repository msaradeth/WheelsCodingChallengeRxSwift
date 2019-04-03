//
//  StackApiService.swift
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/2/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
 

enum APIError: Error {
    case parseError
}

enum APIConstant {
    static let baseUrl = "https://api.stackexchange.com/2.2/users?"
}

class StackApiService: NSObject {
    
    func loadData(completion: @escaping ([User]) -> Void) {
        var users: [User] = []
        var params: [String:String] = [:]
        params["site"] = "stackoverflow"
        params["page"] = "1"
        params["sort"] = "reputation"
        params["order"] = "desc"
        
        HttpHelper.request(APIConstant.baseUrl, method: .get, params: params, success: { (responseObj) in
            guard let data = responseObj.data else { completion(users); return }
            do {
                let service = try JSONDecoder().decode(UserService.self, from: data)
                users = service.items
            }catch let error {
                print(error.localizedDescription)
            }
            completion(users)
            
        }) { (error) in
            print(error.localizedDescription)
            completion(users)
        }
    }    
}
