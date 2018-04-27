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

class VideoSearch: UIViewController, UISearchBarDelegate, UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var signOutButton: UIButton!
    private var videos:[VideoData] = []
    private let youtubeService = GTLRYouTubeService.init()
    private var savedVideoID: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.scrollView.delegate = self
        self.searchBar.delegate = self
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.scrollView.contentSize = CGSize.init(width: Int.init(self.view.frame.width), height: Int.init(self.view.frame.height))
        self.collectionView.contentSize = CGSize.init(width: self.view.frame.width, height: self.view.frame.height)
        //self.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CellID")
        //self.tableView.delegate = self
        //self.tableView.dataSource = self
        //self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "CellID")
        youtubeService.apiKey = "AIzaSyBFKTay4F6Cb3-PlmRGfsAwxA9ztVu8J_4"
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text!)
        //self.tableView.reloadData()
        print("Before empyting videos, video count is")
        print(videos.count)
        videos.removeAll()
        //DispatchQueue.main.async {
            //[unowned self] in
            self.searchVideos(searchBar.text!)
            //print("Video count is")
            //print(self.videos.count)
            //self.tableView.reloadData()
        //}
         //print("Video count after downloading data is")
        //print(self.videos.count)
        //self.tableView.reloadData()
    }
    
    private func searchVideos(_ userQuery: String){
        let query = GTLRYouTubeQuery_SearchList.query(withPart: "snippet")
        query.maxResults = UInt.init(50.0)
        query.q = userQuery
        query.safeSearch = "strict"
        youtubeService.executeQuery(query, delegate: self, didFinish: #selector(displaySearchResults(ticket:finishedWithObject:error:)))
    }
    
    @objc private func displaySearchResults(ticket: GTLRServiceTicket,
                                      finishedWithObject response: GTLRYouTube_SearchListResponse,
                                      error: NSError?){
        if error != nil{
            print("An error occurred in parsing API Data.")
            print(error as Any)
            return
        }
        //print(response)
        //print(response.items!)
        for item in response.items!{
            let videoData = VideoData.init()
            let imageURL = item.snippet!.thumbnails!.high!.url!
            //print(imageURL)
            videoData.videoImage.downloadImageFromURL(URLString: imageURL)
            videoData.title = item.snippet!.title!
            videoData.description = item.snippet!.descriptionProperty!
            videoData.channelTitle = item.snippet!.channelTitle!
            videoData.channelID = item.snippet!.channelId!
            if (item.identifier!.videoId != nil){
                videoData.videoID = item.identifier!.videoId!
            }else{
                videoData.videoID = ""
            }
            //videoData.videoID = item.identifier!.videoId!
            videos.append(videoData)
        }
        print("Video count after downloading data is")
        print(videos.count)
        DispatchQueue.main.async {
        //self.tableView.reloadData()
            self.collectionView.reloadData()
            self.view.reloadInputViews()
            return
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.view.frame.width, height: 250)
    }

    @IBAction func logOut(_ sender: Any, forEvent event: UIEvent) {
        GIDSignIn.sharedInstance().signOut()
        GIDSignIn.sharedInstance().disconnect()
        DispatchQueue.main.async(){
            [unowned self] in
            self.performSegue(withIdentifier: "LogOut", sender: self.signOutButton)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Inside table view numberOfRowsInSection function")
        print(videos.count)
        return self.videos.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //print("inside cellForRowAt function tableview")
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! TableViewCell
        //let cell = TableViewCell()
        cell.videoImage.image = videos[indexPath.row].videoImage.image
        cell.videoTitle.text = videos[indexPath.row].title
        //print(videos[indexPath.row].title)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath) as! CollectionViewCell
        cell.videoImage.image = videos[indexPath.row].videoImage.image
        cell.videoTitle.text = videos[indexPath.row].title
        cell.videoDescription.text = videos[indexPath.row].description
        cell.channelTitle.text = videos[indexPath.row].channelTitle
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        savedVideoID = videos[indexPath.row].videoID
        performSegue(withIdentifier: "playVideo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playVideo"{
            let destinationViewController = segue.destination as! PlayYouTubeVideoViewController
            destinationViewController.YouTubeVideoID = savedVideoID
        }
    }
}
