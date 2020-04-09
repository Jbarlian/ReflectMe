//
//  OnboardingVC.swift
//  ReflectMe
//
//  Created by Nixi Sendya Putri on 07/04/20.
//  Copyright © 2020 Group 11 - Apple Developer Academy. All rights reserved.
//

import UIKit

class OnboardingVC: UIViewController {

    @IBOutlet weak var textFieldName: UITextField!
    
    let defaults = UserDefaults.standard
    
    var userName: String = ""
    //var user = User(username: "", dateJoined: Date(), badges: [""])
    
    var user = [
        "name": "",
        "dateJoined": ""
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.isNavigationBarHidden = true
    }

    
    @IBAction func startButtonTapped(_ sender: Any) {
        userName = textFieldName.text!
        
        let df = DateFormatter()
        df.dateFormat = "MMM d, yyyy"
        let dateJoined = df.string(from: Date())
        
        user["name"] = userName
        user["dateJoined"] = dateJoined
        
        defaults.set(user, forKey: "user")
    
        performSegue(withIdentifier: "toHomePage", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
