//
//  AddUserVC.swift
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/2/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit



class UserDetailVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel: UserDetailViewModel!
    var delegate: ListVCDelegate?
    
    static func createWith(title: String, viewModel: UserDetailViewModel) -> UserDetailVC {
        let storyboard = UIStoryboard.init(name: "StackUserList", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddUserVC") as! UserDetailVC
        vc.title = title
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "UserDetailTableViewCell", bundle: nil), forCellReuseIdentifier: UserDetailTableViewCell.cellIdentifier)
    }
    
  
    
    @IBAction func addUserAction(_ sender: Any) {
        delegate?.addNewUser(user: viewModel.user)
        navigationController?.popViewController(animated: true)
    }
    
}

extension UserDetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.cellIdentifier, for: indexPath) as! UserDetailTableViewCell
        cell.textField.delegate = self
        cell.configure(item: viewModel.items[indexPath.row], row: indexPath.row)
        return cell
    }
}

extension UserDetailVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! UserDetailTableViewCell
        cell.textField.delegate = self
    }
}

extension UserDetailVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        viewModel.items[textField.tag].text = text
    }
}
