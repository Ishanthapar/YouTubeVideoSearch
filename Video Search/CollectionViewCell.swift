//
//  CollectionViewCell.swift
//  Video Search
//
//  Created by Ishan Thapar on 4/26/18.
//  Copyright © 2018 Ishan Thapar. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var videoDescription: UITextView! = UITextView.init()
    @IBOutlet var videoTitle: UITextView! = UITextView.init()
    @IBOutlet var videoImage: UIImageView! = UIImageView.init()
    @IBOutlet var channelTitle: UITextView! = UITextView.init()
}
