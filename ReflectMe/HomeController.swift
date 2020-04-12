//
//  ViewController.swift
//  ReflectMe
//
//  Created by James Barlian on 03/04/20.
//  Copyright © 2020 Group 11 - Apple Developer Academy. All rights reserved.
//

import UIKit

class HomeController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var dayTimer: Timer?
    @IBOutlet weak var greetingsLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var createButtonText: UILabel!
    @IBOutlet weak var storySubs: UILabel!
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    
    
    @IBAction func editTodayPost(_ sender: Any) {
        performSegue(withIdentifier: "detailpageVC", sender: posts[0])
    }
    
    
    var currentDate = ""
    var posts:[Post] = [Post(postId: 1, postDate: Date(timeIntervalSinceReferenceDate: -123456789.0), postEmotion: "happy", postDo: "Senang", postThought: "Bahagia")]
    var user:User?
    var defaultPost = Post(postId: 1, postDate: Date(timeIntervalSinceReferenceDate: -123456789.0), postEmotion: "happy", postDo: "Senang", postThought: "Bahagia")
    var todayPost = Post(postId: -999, postDate: Date(), postEmotion: "", postDo: "", postThought: "")
    
    private let reuseIdentifier = "productCell"
    
    let defaults = UserDefaults.standard
    
    //unwind segue
    @IBAction func segueFromInput (_ sender: UIStoryboardSegue) {
        guard let postFromInput = sender.source as? InputPageVC else { return }
        postFromInput.aPost?.postDo = postFromInput.doText.text
        postFromInput.aPost?.postThought = postFromInput.textView.text
        
        postFromInput.aPost?.postId = posts.count
        posts.reverse()
        posts.append(postFromInput.aPost ?? defaultPost)
        posts.reverse()
        
        // Save posts to UserDefault
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(posts) {
            defaults.set(encoded, forKey: "savedPosts")
        }
        checkForBadges()
        
//        homeTableView.reloadData()
//        If u want Today post is editable, use this instead
        refreshDisplay()
    }
    
    //edit unwind segue
    @IBAction func segueFromDetail (_ sender: UIStoryboardSegue){
        guard let editDataFromDetail = sender.source as? detailpageVC else {return}
        //print(posts)
        let newDo = editDataFromDetail.reflectionStory.text
        let newThought = editDataFromDetail.reflectionThought.text
        posts[0].postDo = newDo ?? posts[0].postDo
        posts[0].postThought = newThought ?? posts[0].postThought
        refreshDisplay()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.delegate = self
        homeTableView.dataSource = self
        dayTimer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(aNewDay), userInfo: nil, repeats: true)
        
        GetTime()
        GetCurrentDate()
        // Get Posts from User Defaults
        if let savedPosts = defaults.object(forKey: "savedPosts") as? Data {
            let decoder = JSONDecoder()
            if let loadedPosts = try? decoder.decode([Post].self, from: savedPosts) {
                posts = loadedPosts
            }
        }
        
        // Set Name with User Default
        if let savedUser = defaults.object(forKey: "savedUser") as? Data {
            let decoder = JSONDecoder()
            if let loadedUser = try? decoder.decode(User.self, from: savedUser) {
                usernameLabel.text = loadedUser.username
                user = loadedUser
            }
        }
        refreshDisplay()
        print(posts)
    }
    
    
    func GetTime () {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 6..<12:
            greetingsLabel.text = "Good Morning,"
        case 12..<17:
            greetingsLabel.text = "Good Afternoon,"
        case 17..<22:
            greetingsLabel.text = "Good Evening,"
        default:
            greetingsLabel.text = "Good Night,"
        }
    }
    
    
    func GetCurrentDate() {
        // Gets tne current date
        let currentDateTime = Date()

        // Initialize formatter and set style
        let format = DateFormatter()
        format.dateStyle = .long

        dateLabel.text = format.string(from: currentDateTime)
        currentDate = format.string(from: Date())
    }
    
//    function Table View
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "aHomeCell", for: indexPath)
       
        /***** DateFormatter Part *****/
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
         
        let dateString = formatter.string(from: posts[indexPath.row].postDate)
        //dateString now contains the string:
        //"December 25, 2019 at 7:00:00 AM"
        
        cell.textLabel?.text = dateString
        cell.detailTextLabel?.text = posts[indexPath.row].postDo
        cell.imageView?.image = UIImage(named: "sad-2")
        return cell
    }
    
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let post = posts[indexPath.row]
            performSegue(withIdentifier: "detailpageVC", sender: post)
        }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailPageControl = segue.destination as? detailpageVC{
            detailPageControl.aPost = sender as! Post
            if formatDate(detailPageControl.aPost.postDate) == formatDate(Date()){
                detailPageControl.isEdit = true
            } else {
                detailPageControl.isEdit = false
            }
        }
    }
    
    
    //profile stuff
    func checkForBadges() {
        if posts.count == 5 {
            print("You earned a badge for having 5 entries!")
            user?.badges.append("profile-badge")
        }
        
        if posts.count == 10 {
            print("You earned a badge for having 10 entries!")
            user?.badges.append("profile-badge-2")
        }
        
        if posts.count == 15 {
            print("You earned a badge for having 15 entries!")
            user?.badges.append("profile-badge-3")
        }
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "savedUser")
        }
    }
    
    //rubah ke -> dd MMMM y
    func formatDate (_ date:Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM y"
        let desiredDateFormat = dateFormatter.string(from: date)
        return desiredDateFormat
    }
    
    //check apakah user sudah melakukan post hari ini
    func anyPostToday() -> Bool {
        if formatDate(Date()) == formatDate(posts[0].postDate) {
            return true
        }
        return false
    }
    
    
    func refreshDisplay(){
        if anyPostToday() == true {
            editButton.isEnabled = true
            editButton.isHidden = false
            createButton.isEnabled = false
            createButton.isHidden = true
            createButtonText.text = "Edit Today's Post"
            storySubs.text = posts[0].postDo
        }
        else if anyPostToday() == false {
            editButton.isEnabled = false
            editButton.isHidden = true
            createButton.isEnabled = true
            createButton.isHidden = false
            createButtonText.text = "+ Create New Story"
            storySubs.text = "Add today's Story"
        }
        homeTableView.reloadData()
    }
    
    //check if now is tomorrow
    @objc func aNewDay(){
        //print ("checking time")
        let x = currentHour()
        let y = currentMinute()
        if (x == 00 && y == 00){
            refreshDisplay()
        }
    }
    
     func currentHour() -> Int {
          let date = Date()
          let calendar = Calendar.current
          let hour = calendar.component(.hour, from: date)
          //let minutes = calendar.component(.minute, from: date)
          return hour
      }
    
      func currentMinute() -> Int {
          let date = Date()
          let calendar = Calendar.current
          //let hour = calendar.component(.hour, from: date)
          let minute = calendar.component(.minute, from: date)
          return minute
      }
}


