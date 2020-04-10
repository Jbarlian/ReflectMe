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
    
    //dummy data, delete this when segue is prepared in home page
    var aPost = Post (postId: 1, postDate: Date(), postEmotion: "happy", postDo: "blabla", postThought: "blulb")
    let date:Date = Date()
    
//  put this to the tableview class (kayanya harus bikin lagi)
//  ==================================================
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let post = posts[indexPath.row]
//        performSegue(withIdentifier: "detailpageVC", sender: post)
//    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let detailPageControl = segue.destination as? detailpageVC{
//            detailPageControl.aPost = sender
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        print(outputFormat)
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
