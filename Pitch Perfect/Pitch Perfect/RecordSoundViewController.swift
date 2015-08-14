//
//  RecordSoundViewController.swift
//  Pitch Perfect
//
//  Created by Ben Goertz on 5/12/15.
//  Copyright (c) 2015 Ben Goertz. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    var audioRecorder:AVAudioRecorder!
    var recordedAudio:RecordedAudio!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   override func viewWillAppear(animated: Bool) {
        recordLabel.text = "Tap to Record"
        recordLabel.hidden = false
    
        stopButton.hidden = true
    }

    // MARK: IBActions
    
    @IBAction func recordAudio(sender: UIButton) {
        let directoryPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String

        let recordingName = "audioRecording.wav"
        let pathArray = [directoryPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
		let recorderSettings: [String: AnyObject] = [:] // Probably need to pass in actual constants, but this currently works.
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        } catch _ {
        }
        
        do {
			audioRecorder = try AVAudioRecorder(URL: filePath!, settings: recorderSettings)
        } catch _ {
            audioRecorder = nil
        }
        audioRecorder.delegate = self // sets the delegate for AVAudioRecord to this class
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
        recordButton.enabled = false
        
        // Show label when recording.
        stopButton.hidden = false
        recordLabel.text = "Recording"
        recordLabel.hidden = false
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        if (flag) {
            recordedAudio = RecordedAudio(filePathUrl: recorder.url, title: recorder.url.lastPathComponent!)
            
            self.performSegueWithIdentifier("stopRecording", sender: recordedAudio)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "stopRecording") {
            let playSoundsVC:PlaySoundsViewController = segue.destinationViewController as! PlaySoundsViewController
            let data = sender as! RecordedAudio
            playSoundsVC.receivedAudio = data
        }
    }
    
    @IBAction func stopAudio(sender: UIButton) {
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setActive(false)
        } catch _ {
        }
        
        recordButton.enabled = true
        
        // Hide recording label
        recordLabel.hidden = true
    }
}

