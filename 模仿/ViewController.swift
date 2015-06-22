//
//  ViewController.swift
//  模仿
//
//  Created by Leonard Gao on 15/1/8.
//  Copyright (c) 2015年 Leonard Gao. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioRecorderDelegate{

    @IBOutlet weak var stopbutton: UIButton!
    @IBOutlet weak var recording: UILabel!
    @IBOutlet weak var micorphone: UIButton!
    
    var audioRecorder:AVAudioRecorder!
    
    var recordaudio:RecordedAudio!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        stopbutton.hidden = true
        micorphone.enabled = true
        
    }

    @IBAction func recordAudio(sender: UIButton) {
        recording.hidden = false
        stopbutton.hidden = false
        micorphone.enabled = false
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
        
        
        let recordingName = "my_audio.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        println(filePath)
        
        var session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)
        
        audioRecorder = AVAudioRecorder(URL: filePath, settings: nil, error: nil)
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool) {
        recordaudio=RecordedAudio()
        recordaudio.filePathUrl = recorder.url
        recordaudio.title = recorder.url.lastPathComponent
        self.performSegueWithIdentifier("stoprecording", sender: recordaudio)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "stoprecording"){
            let playsounds: playsoundViewController = segue.destinationViewController as! playsoundViewController
            let data = sender as! RecordedAudio
            playsounds.receivedaudio = data
        }
    }

    @IBAction func stopbutton(sender: UIButton) {
        recording.hidden = true
        audioRecorder.stop()
        var audioSession = AVAudioSession.sharedInstance()
        audioSession.setActive(false, error: nil)
    }
}

