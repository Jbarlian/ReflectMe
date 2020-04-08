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
    @IBOutlet weak var textView: UITextView!
    
    var placeholderLabel : UILabel!
    var doTextLabel : UILabel!

    
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
        doTextLabel = UILabel()
        doTextLabel.text = "Tell us about your day :)"
        doTextLabel.font = UIFont.italicSystemFont(ofSize: (doText.font?.pointSize)!)
        doTextLabel.sizeToFit()
        doText.addSubview(doTextLabel)
        doTextLabel.frame.origin = CGPoint(x: 5, y: (doText.font?.pointSize)! / 2)
        doTextLabel.textColor = UIColor.lightGray
        doTextLabel.isHidden = !doText.text.isEmpty
    }

    func ThoughtsPlaceHolder (){
        textView.delegate = self
        placeholderLabel = UILabel()
        placeholderLabel.text = "Tell us whats on your mind :)"
        placeholderLabel.font = UIFont.italicSystemFont(ofSize: (textView.font?.pointSize)!)
        placeholderLabel.sizeToFit()
        textView.addSubview(placeholderLabel)
        placeholderLabel.frame.origin = CGPoint(x: 5, y: (textView.font?.pointSize)! / 2)
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
      
        // Insert placeholders
        FeelingsPlaceHolder()
        ThoughtsPlaceHolder()
//
//        //Get rid of placeholder
//        doTextDidChange(doText)
//        thoughtTextDidChange(thoughtText)


        
//        // Print Today's Date
        GetCurrentDate()
    
    }

    func textViewDidChange(_ doText: UITextView) {
        doTextLabel.isHidden = !doText.text.isEmpty
        }
    
//    func textViewDidChange(_ textView: UITextView) {
//        placeholderLabel.isHidden = !textView.text.isEmpty
//    }
}

