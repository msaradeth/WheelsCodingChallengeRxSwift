//
//  ListViewModel.swift
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/2/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import RxSwift

class ListViewModel {
    let disposeBag = DisposeBag()
    var subject: BehaviorSubject<[User]>
    var items: [User] {
        didSet {
            subject.onNext(items)
        }
    }
    var stackApiService: StackApiService
    
    init(items: [User], stackApiService: StackApiService) {
        self.items = items
        self.stackApiService = stackApiService
        self.subject = BehaviorSubject<[User]>(value: items)
    }
    
    func loadData() {
        stackApiService.loadData()
            .subscribe(onSuccess: { [weak self] (items) in
                guard let self = self else { return }
                self.items = items
                self.subject.onNext(items)
            }) { (error) in
                print(error.localizedDescription)
            }
            .disposed(by: disposeBag)
    }
    
}
