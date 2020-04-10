//
//  ViewController.swift
//  ReflectMe
//
//  Created by James Barlian on 03/04/20.
//  Copyright © 2020 Group 11 - Apple Developer Academy. All rights reserved.
//

import UIKit

class HomeController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var greetingsLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
   
        
    
    @IBOutlet weak var homeTableView: UITableView!
    
    var currentDate = ""
    var posts:[Post] = []
    var defaultPost = Post(postId: 1, postDate: Date(), postEmotion: "happy", postDo: "Senang", postThought: "Bahagia")
    
    private let reuseIdentifier = "productCell"
    
    
    
    //unwind segue
    @IBAction func segueFromInput (_ sender: UIStoryboardSegue) {
        guard let postFromInput = sender.source as? InputPageVC else { return }
        postFromInput.aPost?.postDo = postFromInput.doText.text
        postFromInput.aPost?.postThought = postFromInput.textView.text
        posts.append(postFromInput.aPost ?? defaultPost)
        print(posts.count)
        print(posts)
        homeTableView.reloadData()
    }

    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        GetTime()
        GetCurrentDate()
        
        posts.append(defaultPost)
        posts.append(Post(postId: 2, postDate: Date(), postEmotion: "sad", postDo: "TWO", postThought: "Dua"))
        
        
        // Set Name with User Default
        if let savedUser = defaults.object(forKey: "savedUser") as? Data {
            let decoder = JSONDecoder()
            if let loadedUser = try? decoder.decode(User.self, from: savedUser) {
                usernameLabel.text = loadedUser.username
            }
        }
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
//        cell.imageView?.image = UIImage(named: categories[indexPath.row].categoryImage)
        return cell
    }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let post = posts[indexPath.row]
            performSegue(withIdentifier: "detailpageVC", sender: post)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let detailPageControl = segue.destination as? detailpageVC{
                detailPageControl.aPost = sender as! Post
            }
        }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 150
//    }
}


