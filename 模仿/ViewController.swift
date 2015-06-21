//
//  ViewController.swift
//  模仿
//
//  Created by Leonard Gao on 15/1/8.
//  Copyright (c) 2015年 Leonard Gao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stopbutton: UIButton!
    @IBOutlet weak var recording: UILabel!
    @IBOutlet weak var micorphone: UIButton!
    
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
        
    }

    @IBAction func stopbutton(sender: UIButton) {
    }
}

