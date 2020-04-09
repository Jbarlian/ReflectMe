//
//  detailpageVC.swift
//  ReflectMe
//
//  Created by Fauzan Ramadhan on 07/04/20.
//  Copyright © 2020 Group 11 - Apple Developer Academy. All rights reserved.
//

import UIKit

class detailpageVC: UIViewController {

    @IBOutlet weak var reflectionEmotionBg: UIImageView!
    @IBOutlet weak var reflectionDate: UILabel!
    @IBOutlet weak var reflectionMonthYear: UILabel!
    @IBOutlet weak var reflectionDay: UILabel!
    @IBOutlet weak var reflectionStory: UITextView!
    
//    var aPost = Post (postId: 1, postDate: Date(), postEmotion: "happy", postDo: "blabla", postThought: "blulb")
    var aPost:Post?
    
//    receiving data from homepage (post Id aja)
//    func initPost(postId: Int) {
//
//      self.navigationItem.title = post.postId
//    }
    
    
//    fungsi akses data di database dengan coredata, sesuai postId
    
//
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reflectionStory.text = "\(aPost?.postDo ?? " ")\n\n\(aPost?.postThought ?? " ")"
        
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
