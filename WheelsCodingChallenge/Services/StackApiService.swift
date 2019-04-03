//
//  StackApiService.swift
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/2/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import RxSwift

enum APIError: Error {
    case parseError
}

enum APIConstant {
    static let baseUrl = "https://api.stackexchange.com/2.2/users?"
}

class StackApiService: NSObject {
    
    func loadData() -> Single<[User]> {
        return Single<[User]>.create { single in
            
            var params: [String:String] = [:]
            params["site"] = "stackoverflow"
            params["page"] = "1"
            params["sort"] = "reputation"
            params["order"] = "desc"
            
            HttpHelper.request(APIConstant.baseUrl, method: .get, params: params, success: { (responseObj) in
                guard let data = responseObj.data else { single(.error(APIError.parseError)); return }
                do {
                    let responseObj = try JSONDecoder.init().decode(ResponseObj.self, from: data)
                    single(.success(responseObj.items))
                }catch let error {
                    print(error.localizedDescription)
                    single(.error(APIError.parseError))
                }
            }, failure: { (error) in
                print(error.localizedDescription)
                single(.error(APIError.parseError))
            })
            
            return Disposables.create()
        }
    }
}
