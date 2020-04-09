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
    
   
    var aPost = Post (postId: 1, postDate: Date(), postEmotion: "happy", postDo: "blabla", postThought: "blulb")
    let posts = [Post (postId: 1, postDate: Date(), postEmotion: "sad", postDo: "blabla", postThought: "blulb")]
    
//    receiving data from homepage (post Id aja)
//    func initPost(postId: Int) {
//
//      self.navigationItem.title = post.postId
//    }
    
    
//    fungsi akses data di database dengan coredata, sesuai postId
    
//
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reflectionDay.text = posts[0].postEmotion
        
        
        // Do any additional setup after loading the view.
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
