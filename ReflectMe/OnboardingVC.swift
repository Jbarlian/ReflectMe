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
    
    var userName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.isNavigationBarHidden = true
    }

    
    @IBAction func startButtonTapped(_ sender: Any) {
        
        validateName()
        
        let df = DateFormatter()
        df.dateFormat = "MMM d, yyyy"
        let dateJoined = df.string(from: Date())
        
        let user = User(username: userName, dateJoined: dateJoined, badges: ["profile-badge", "profile-badge-2", "profile-badge-2"])
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "savedUser")
        }
    
        performSegue(withIdentifier: "toHomePage", sender: self)
    }
    
    func validateName() {
        
        if textFieldName.text == "" {
            let alert = UIAlertController(title: "Uh Oh!", message: "Name cannot be empty", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            userName = textFieldName.text!
        }
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
