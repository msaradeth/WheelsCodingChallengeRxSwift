//
//  ListVC.swift
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/2/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ListVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let disposeBag = DisposeBag()
    var viewModel: ListViewModel!
    
    static func createWith(title: String, viewModel: ListViewModel) -> ListVC {
        let storyboard = UIStoryboard.init(name: "StackUserList", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ListVC") as! ListVC
        vc.title = title
        vc.viewModel = viewModel
        return vc
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRx()
        viewModel.loadData()
    }
    
    func setupRx() {
        tableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: ListTableViewCell.cellIdentifier)
        
        viewModel.subject.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: ListTableViewCell.cellIdentifier, cellType: ListTableViewCell.self)) { [weak self]
                (row, item, cell) in
                guard let self = self else { return }
                cell.configure(item: item, row: row, delegate: self.viewModel)
        }
        .disposed(by: disposeBag)
    }


}
