//
//  ViewController.swift
//  ReflectMe
//
//  Created by James Barlian on 03/04/20.
//  Copyright © 2020 Group 11 - Apple Developer Academy. All rights reserved.
//

import UIKit

class InputPageVC: UIViewController, UITextViewDelegate {

    // Text Views
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var superHappyImage: UIButton!
    @IBOutlet weak var happyImage: UIButton!
    @IBOutlet weak var neutralImage: UIButton!
    @IBOutlet weak var sadImage: UIButton!
    @IBOutlet weak var superSadImage: UIButton!
    
    @IBOutlet weak var doText: UITextView!
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func dismissButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // Label for placeholders
    var placeholderLabel : UILabel!
    var doTextLabel : UILabel!

    // Data for Inputs
    var aPost : Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        aPost?.postId = 1
        aPost?.postEmotion = "happy"
        aPost?.postDo = doText.text
        aPost?.postThought = textView.text

        
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
        if superSadImage.currentBackgroundImage == #imageLiteral(resourceName: "sad-2"){
                superSadImage.setBackgroundImage(#imageLiteral(resourceName: "sad-3"), for: .normal)
                aPost?.postEmotion = "super-sad"
            }
            else{
                superSadImage.setBackgroundImage(#imageLiteral(resourceName: "sad-2"), for: .normal)
            }
    }
    
    @IBAction func sadButton(_ sender: UIButton) {
        if sadImage.currentBackgroundImage == #imageLiteral(resourceName: "sad"){
            sadImage.setBackgroundImage(#imageLiteral(resourceName: "sad-1"), for: .normal)
            aPost?.postEmotion = "sad"
        }
        else{
            sadImage.setBackgroundImage(#imageLiteral(resourceName: "sad"), for: .normal)
        }
    }
  
    @IBAction func neutralButton(_ sender: UIButton) {
        if neutralImage.currentBackgroundImage == #imageLiteral(resourceName: "meh"){
            neutralImage.setBackgroundImage(#imageLiteral(resourceName: "meh-1"), for: .normal)
            aPost?.postEmotion = "neutral"
        }
        else{
            neutralImage.setBackgroundImage(#imageLiteral(resourceName: "meh"), for: .normal)
        }
    }
    
    @IBAction func happyButton(_ sender: UIButton) {
        
        if happyImage.currentBackgroundImage == #imageLiteral(resourceName: "smile-2"){
            happyImage.setBackgroundImage(#imageLiteral(resourceName: "smile-3"), for: .normal)
            aPost?.postEmotion = "happy"
        }
        else{
            happyImage.setBackgroundImage(#imageLiteral(resourceName: "smile-2"), for: .normal)
        }
    }
    
    @IBAction func superHappyButton(_ sender: Any) {
        
        if superHappyImage.currentBackgroundImage == #imageLiteral(resourceName: "happy"){
            superHappyImage.setBackgroundImage(#imageLiteral(resourceName: "happy-1"), for: .normal)
            aPost?.postEmotion = "super-happy"
        }
        else{
            superHappyImage.setBackgroundImage(#imageLiteral(resourceName: "happy"), for: .normal)
        }
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

