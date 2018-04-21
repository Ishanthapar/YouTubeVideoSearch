//
//  VideoSearch.swift
//  Video Search
//
//  Created by Ishan Thapar on 4/21/18.
//  Copyright © 2018 Ishan Thapar. All rights reserved.
//

import UIKit
import GoogleSignIn
import GoogleAPIClientForREST

class VideoSearch: UIViewController {

    //@IBOutlet weak var signOutButton: UIBarButtonItem!
    @IBOutlet weak var signOutButton: UIButton!
    private let youtubeService = GTLRYouTubeService.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func logOut(_ sender: Any, forEvent event: UIEvent) {
        GIDSignIn.sharedInstance().signOut()
        DispatchQueue.main.async(){
            [unowned self] in
            self.performSegue(withIdentifier: "LogOut", sender: self.signOutButton)
        }
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
