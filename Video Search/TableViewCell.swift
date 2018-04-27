//
//  TableViewCell.swift
//  Video Search
//
//  Created by Ishan Thapar on 4/23/18.
//  Copyright © 2018 Ishan Thapar. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var videoImage: UIImageView! = UIImageView.init()
    @IBOutlet var videoTitle: UITextView! = UITextView.init()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
