//
//  detailpageVC.swift
//  ReflectMe
//
//  Created by Fauzan Ramadhan on 07/04/20.
//  Copyright © 2020 Group 11 - Apple Developer Academy. All rights reserved.
//

import UIKit

class detailpageVC: UIViewController {

    //set the outlet of each element
    @IBOutlet weak var reflectionEmotionBg: UIImageView!
    @IBOutlet weak var reflectionDate: UILabel!
    @IBOutlet weak var reflectionMonthYear: UILabel!
    @IBOutlet weak var reflectionDay: UILabel!
    @IBOutlet weak var reflectionStory: UITextView!
    
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    //dummy data, delete this when segue is prepared in home page
    var aPost = Post (postId: 1, postDate: Date(), postEmotion: "happy", postDo: "blabla", postThought: "blulb")
    let date:Date = Date()
    
    var isEdit: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isEdit{
            reflectionStory.isEditable = true
            doneButton.isHidden = false
            backButton.isHidden = true
        } else {
            reflectionStory.isEditable = false
            doneButton.isHidden = true
            backButton.isHidden = false
        }
        
        
        //put background image
        switch aPost.postEmotion {
        case "angry":
            reflectionEmotionBg.image = UIImage (named: "bg-smile")
        case "sad":
            reflectionEmotionBg.image = UIImage (named: "bg-smile")
        case "flat":
            reflectionEmotionBg.image = UIImage (named: "bg-smile")
        case "smile":
            reflectionEmotionBg.image = UIImage (named: "bg-smile")
        case "happy":
            reflectionEmotionBg.image = UIImage (named: "bg-smile")
        default:
            print("error")
        }
        
        //put date
        reflectionDate.text = "\(currentNow(date, "day"))"
        reflectionMonthYear.text = "\(currentNow(date, "month")), \(currentNow(date, "year"))"
        
        //put the story
        reflectionStory.text = "\(aPost.postDo )\n\n\(aPost.postThought)"
    }
    
    //get specific format of date to be displayed
    func currentNow(_ date:Date, _ outputFormat:String) -> String {
        let dateFormatter = DateFormatter()
        switch outputFormat {
            case "dayname":
                dateFormatter.dateFormat = "EEEE"
            case "day":
                dateFormatter.dateFormat = "dd"
            case "month":
                dateFormatter.dateFormat = "MMMM"
            case "year":
                dateFormatter.dateFormat = "y"
            default:
                dateFormatter.dateFormat = "EEEE"
        }
        let desiredDateFormat = dateFormatter.string(from: date)
        return desiredDateFormat
    }
    
   
    
    
    
    
}
  
//    //ga kepake sih, ikr...
//    receiving data from homepage (post Id aja)
//    func initPost(postId: Int) {
//
//      self.navigationItem.title = post.postId
//    }
