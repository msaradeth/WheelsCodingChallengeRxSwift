//
//  ListVC.swift
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/2/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit


protocol ListVCDelegate {
    func addNewUser(user: User)
}

class ListVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
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
        setup()        
        viewModel.loadData { [weak self] (items) in
            guard let self = self else { return }
            self.viewModel.items = items
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }            
        }
    }
    
    func setup() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: ListTableViewCell.cellIdentifier)
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
        tableView.reloadData()
    }
}

extension ListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.cellIdentifier, for: indexPath) as! ListTableViewCell
        cell.configure(item: viewModel[indexPath.row])
        return cell
    }
}
