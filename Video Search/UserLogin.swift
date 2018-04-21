//
//  UserLogin.swift
//  Video Search
//
//  Created by Ishan Thapar on 4/21/18.
//  Copyright © 2018 Ishan Thapar. All rights reserved.
//

import UIKit
import GoogleSignIn

class UserLogin: UIViewController, GIDSignInUIDelegate {

    var googleLoginButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        GIDSignIn.sharedInstance().uiDelegate = self
        let googleButtonFrame = CGRect.init(x: 0, y: 0, width: 50, height: 50)
        googleLoginButton = GIDSignInButton.init(frame: googleButtonFrame)
        googleLoginButton.center  = self.view.center
        self.view.addSubview(googleLoginButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
