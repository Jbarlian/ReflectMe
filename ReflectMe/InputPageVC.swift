//
//  ViewController.swift
//  ReflectMe
//
//  Created by James Barlian on 03/04/20.
//  Copyright © 2020 Group 11 - Apple Developer Academy. All rights reserved.
//

import UIKit

class InputPageVC: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    
    
    func GetCurrentDate(){
        // Gets tne current date
        let currentDateTime = Date()
        
        // Initialize formatter and set style
        let format = DateFormatter()
        format.dateStyle = .long
        
        dateLabel.text = format.string(from: currentDateTime)
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        GetCurrentDate()
    }


    
}

