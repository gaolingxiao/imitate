//
//  playsoundViewController.swift
//  模仿
//
//  Created by Leonard Gao on 15/6/22.
//  Copyright (c) 2015年 Leonard Gao. All rights reserved.
//

import UIKit
import AVFoundation

class playsoundViewController: UIViewController {

    @IBOutlet weak var snail: UIButton!
    
    @IBOutlet weak var rabbit: UIButton!
    
    var audioPlayer:AVAudioPlayer!
    var receivedaudio:RecordedAudio!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3"){
            
          //  var filePathUrl = NSURL.fileURLWithPath(filePath)
       // }
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedaudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func snailsound(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.rate = 0.5
        audioPlayer.play()
        
    }
   
    @IBAction func rabbitsound(sender: UIButton) {
        audioPlayer.stop()
        
        audioPlayer.rate = 2.0
        
        audioPlayer.play()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
