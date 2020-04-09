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
    
    @IBAction func dismissButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buttonTest(_ sender: Any) {
        aPost?.postDo = doText.text
        
    }
    
    var tesdah = "Apapun"
    
    // Label for placeholders
    var placeholderLabel : UILabel!
    var doTextLabel : UILabel!

    // Data for Inputs
    var aPost: Post? = Post(postId: 1, postDate: Date(), postEmotion: "Happy", postDo: "Aku senang", postThought: "Aku belajar")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//        aPost?.postId = 1
//        aPost?.postEmotion = "happy"
//        aPost?.postDo = doText.text
//        aPost?.postThought = textView.text

        
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
    
    @IBAction func submitButton(_ sender: UIButton) {
        
    }
    
    @IBAction func superSadButton(_ sender: UIButton) {
        
    }
    
    @IBAction func sadButton(_ sender: UIButton) {
        
    }
  
    @IBAction func neutralButton(_ sender: UIButton) {
        
    }
    
    @IBAction func happyButton(_ sender: UIButton) {
        
    }
    
    @IBAction func superHappy(_ sender: UIButton) {
        
    }
    
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
}

