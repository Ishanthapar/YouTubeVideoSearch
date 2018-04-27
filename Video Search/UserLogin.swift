//
//  UserLogin.swift
//  Video Search
//
//  Created by Ishan Thapar on 4/21/18.
//  Copyright © 2018 Ishan Thapar. All rights reserved.
//

import UIKit
import GoogleSignIn

class UserLogin: UIViewController, GIDSignInUIDelegate/*, GIDSignInDelegate*/ {

    var googleLoginButton: GIDSignInButton!
    static var loggedIn: Bool! = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        let googleButtonFrame = CGRect.init(x: 0, y: 0, width: 50, height: 50)
        googleLoginButton = GIDSignInButton.init(frame: googleButtonFrame)
        googleLoginButton.center  = self.view.center
        self.view.addSubview(googleLoginButton)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (UserLogin.loggedIn){
            performSegue(withIdentifier: "VideoSearch", sender: self)
        }
    }
    
    /*override func viewDidAppear(_ animated: Bool) {
        GIDSignIn.sharedInstance().delegate = self
         GIDSignIn.sharedInstance().uiDelegate = self
        
    }*/
    
    /*func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil{
            print("Could not sign in. An error occurred..")
        }else{
            let firstName = user.profile.givenName
            print("You have successfully logged in, \(firstName!).")
            //let videoSearchController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Video Search")
            DispatchQueue.main.async {
                [unowned self] in
                self.performSegue(withIdentifier: "VideoSearch", sender: self)
                //self.window?.rootViewController?.performSegue(withIdentifier: "VideoSearch", sender: self.window?.rootViewController)
            }
        }
    }*/

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
