//
//  PlayYouTubeVideoViewController.swift
//  Video Search
//
//  Created by Ishan Thapar on 4/26/18.
//  Copyright © 2018 Ishan Thapar. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class PlayYouTubeVideoViewController: UIViewController, YTPlayerViewDelegate {
    
    var YouTubeVideoID: String!
    var videoPlayer: YTPlayerView!
    var videoVariables: [AnyHashable: Any]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.videoPlayer.delegate = self
        videoPlayer = YTPlayerView.init(frame: self.view.frame)
        self.videoPlayer.delegate = self
        self.view.addSubview(videoPlayer)
        videoPlayer.load(withVideoId: YouTubeVideoID)
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        self.videoPlayer.playVideo()
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
