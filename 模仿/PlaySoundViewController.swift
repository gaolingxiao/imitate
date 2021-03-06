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
    
    @IBOutlet weak var stop: UIButton!
    
    @IBOutlet weak var rabbit: UIButton!
    
    @IBOutlet weak var chipmunk: UIButton!
    
    @IBOutlet weak var death: UIButton!
    
    var audioPlayer:AVAudioPlayer!
    var receivedaudio:RecordedAudio!
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3"){
            
          //  var filePathUrl = NSURL.fileURLWithPath(filePath)
       // }
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedaudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
        audioEngine = AVAudioEngine()
        
        audioFile = AVAudioFile(forReading: receivedaudio.filePathUrl, error: nil)
        
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
    
    @IBAction func chipmunksounds(sender: UIButton) {
        playAudioWithVariablePitch(1000)
    }
    
    @IBAction func deathsounds(sender: UIButton) {
        playAudioWithVariablePitch(-700)
        
    }
    func playAudioWithVariablePitch(pitch: Float){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
    }
    @IBAction func stopsounds(sender: UIButton) {
        
        audioPlayer.stop()
        audioEngine.stop()
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
