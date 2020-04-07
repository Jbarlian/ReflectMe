//
//  ViewController.swift
//  ReflectMe
//
//  Created by James Barlian on 03/04/20.
//  Copyright © 2020 Group 11 - Apple Developer Academy. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var greetingsLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        GetTime()
        GetCurrentDate()
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
    }

}

