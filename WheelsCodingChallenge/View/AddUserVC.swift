//
//  AddUserVC.swift
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/2/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

class AddUserVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel: AddUserViewModel!
    
    static func createWith(title: String, viewModel: AddUserViewModel) -> AddUserVC {
        let storyboard = UIStoryboard.init(name: "StackUserList", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddUserVC") as! AddUserVC
        vc.title = title
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "AddUserTableViewCell", bundle: nil), forCellReuseIdentifier: AddUserTableViewCell.cellIdentifier)
    }
    
  
    
    @IBAction func addUserAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension AddUserVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AddUserTableViewCell.cellIdentifier, for: indexPath) as! AddUserTableViewCell
        cell.configure(item: viewModel.user)
        
        return cell
    }
    
}

extension AddUserVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

