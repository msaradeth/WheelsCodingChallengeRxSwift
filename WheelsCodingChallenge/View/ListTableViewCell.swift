//
//  ListTableViewCell.swift
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/2/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    static let cellIdentifier = "Cell"
    @IBOutlet weak var gravator: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var reputation: UILabel!
    
    func configure(item: User) {
        name.text = item.name
        reputation.text = item.reputation.formatWithCommas()
        
        if let image = Cache.shared.image[item.urlString] {
            gravator.image = image
        }else {
            //Load Image from UrlString
            DispatchQueue.global().async {
                guard let url = URL(string: item.urlString),
                    let data = try? Data(contentsOf: url) else { return }
                let image = UIImage(data: data)
                Cache.shared.image[item.urlString] = image
                DispatchQueue.main.async {
                    self.gravator.image = image
                }                
            }
        }
    }
    
}
