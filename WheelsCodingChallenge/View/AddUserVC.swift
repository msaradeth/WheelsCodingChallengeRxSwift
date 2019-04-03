//
//  AddUserVC.swift
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/2/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AddUserVC: UIViewController {
    let disposeBag = DisposeBag()
    var viewModel: AddUserViewModel!
    

    @IBOutlet weak var tableView: UITableView!
    
    static func createWith(title: String, viewModel: AddUserViewModel) -> AddUserVC {
        let storyboard = UIStoryboard.init(name: "StackUserList", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddUserVC") as! AddUserVC
        vc.title = title
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "AdduserTableViewCell", bundle: nil), forCellReuseIdentifier: AddUserTableViewCell.cellIdentifier)
        
        viewModel.subject.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: AddUserTableViewCell.cellIdentifier, cellType: AddUserTableViewCell.self)) { (row, item, cell) in
//                cell.con
        }
    }
    
  
    
    @IBAction func addUserAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
