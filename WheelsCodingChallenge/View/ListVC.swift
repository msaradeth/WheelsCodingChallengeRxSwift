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

protocol ListVCDelegate {
    func addNewUser(user: User)
}

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
            .bind(to: tableView.rx.items(cellIdentifier: ListTableViewCell.cellIdentifier, cellType: ListTableViewCell.self)) { 
                (row, item, cell) in
                cell.configure(item: item)
        }
        .disposed(by: disposeBag)
    }

    @IBAction func addUser(_ sender: Any) {
        let viewModel = UserDetailViewModel(user: nil)
        let vc = UserDetailVC.createWith(title: "Add User", viewModel: viewModel)
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ListVC: ListVCDelegate {
    func addNewUser(user: User) {
        viewModel.items.append(user)
    }
}
