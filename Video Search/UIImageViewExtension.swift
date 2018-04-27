//
//  UIImageViewExtension.swift
//  Video Search
//
//  Created by Ishan Thapar on 4/24/18.
//  Copyright © 2018 Ishan Thapar. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView{
    
    public func downloadImageFromURL(URLString: String!){
        
        URLSession.shared.dataTask(with: NSURL.init(string: URLString)! as URL, completionHandler: {(data, response, error) -> Void in
            
            if error != nil{
                print(error as Any)
                return
            }
            
            DispatchQueue.main.async(execute: {() -> Void in
                self.image = UIImage.init(data: data!)
            })
            
        }).resume()
        
    }
    
}
