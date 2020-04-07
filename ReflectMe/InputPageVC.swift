//
//  ViewController.swift
//  ReflectMe
//
//  Created by James Barlian on 03/04/20.
//  Copyright © 2020 Group 11 - Apple Developer Academy. All rights reserved.
//

import UIKit

class InputPageVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var doText: UITextView!
    @IBOutlet weak var thoughtText: UITextView!
    
    var placeHolderLabel: UILabel!
    
    func GetCurrentDate(){
        // Gets tne current date
        let currentDateTime = Date()
        
        // Initialize formatter and set style
        let format = DateFormatter()
        format.dateStyle = .long
        
        dateLabel.text = format.string(from: currentDateTime)
    }
    
    func FeelingsPlaceHolder () {
        doText.delegate = self
        placeHolderLabel = UILabel()
        placeHolderLabel.text = "Tell us about your day :)"
        placeHolderLabel.font = UIFont.italicSystemFont(ofSize: (doText.font?.pointSize)!)
        placeHolderLabel.sizeToFit()
        doText.addSubview(placeHolderLabel)
        placeHolderLabel.frame.origin = CGPoint(x: 5, y: (doText.font?.pointSize)! / 2)
        placeHolderLabel.textColor = UIColor.lightGray
        placeHolderLabel.isHidden = !doText.text.isEmpty
    }
   
    func ThoughtsPlaceHolder (){
        thoughtText.delegate = self
        placeHolderLabel = UILabel()
        placeHolderLabel.text = "Tell us what's on your mind for today :)"
        placeHolderLabel.font = UIFont.italicSystemFont(ofSize: (thoughtText.font?.pointSize)!)
        placeHolderLabel.sizeToFit()
        thoughtText.addSubview(placeHolderLabel)
        placeHolderLabel.frame.origin = CGPoint(x: 5, y: (thoughtText
            .font?.pointSize)! / 2)
        placeHolderLabel.textColor = UIColor.lightGray
        placeHolderLabel.isHidden = !thoughtText.text.isEmpty
    }
    
    
    func doTextDidChange(_ doText: UITextView) {
        placeHolderLabel.isHidden = !doText.text.isEmpty
    }
    
    func thoughtTextDidChange(_ thoughtText: UITextView) {
        placeHolderLabel.isHidden = !thoughtText.text.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Insert placeholders
        FeelingsPlaceHolder()
        ThoughtsPlaceHolder()
        
        //Get rid of placeholder
        doTextDidChange(doText)
        thoughtTextDidChange(thoughtText)
        
        // Print Today's Date
        GetCurrentDate()
        
        
        
    }


    
}

