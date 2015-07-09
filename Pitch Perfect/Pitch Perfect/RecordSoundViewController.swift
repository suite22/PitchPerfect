//
//  RecordSoundViewController.swift
//  Pitch Perfect
//
//  Created by Ben Goertz on 5/12/15.
//  Copyright (c) 2015 Ben Goertz. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController {

    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    var audioRecorder:AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   override func viewWillAppear(animated: Bool) {
        stopButton.hidden = true
    }

    // MARK: IBActions
    
    @IBAction func recordAudio(sender: UIButton) {
        
        
        recordButton.enabled = false
        
        // Show label when recording.
        stopButton.hidden = false
        recordLabel.hidden = false
    }
    
    @IBAction func stopAudio(sender: UIButton) {
        //println("Stop recording please.")
        
        recordButton.enabled = true
        
        // Hide recording label
        recordLabel.hidden = true
    }
}

