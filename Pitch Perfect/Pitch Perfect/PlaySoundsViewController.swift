//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Ben Goertz on 6/1/15.
//  Copyright (c) 2015 Ben Goertz. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var audioPlayer: AVAudioPlayer!
    var receivedAudio: RecordedAudio!
    
    var audioEngine: AVAudioEngine!
    var audioFile: AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl)
        } catch _ {
            audioPlayer = nil
        }
        audioPlayer.enableRate = true
        
        audioEngine = AVAudioEngine()
        do {
            audioFile = try AVAudioFile(forReading: receivedAudio.filePathUrl)
        } catch _ {
            audioFile = nil
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: IBActions
    
    @IBAction func playSlow(sender: AnyObject) {
        print("Slow it down there!")
        setPlaybackSpeed(0.5)
        audioPlayer.play()
    }
    
    @IBAction func playFast(sender: AnyObject) {
        print("Let's play fast!")
        setPlaybackSpeed(1.5)
        audioPlayer.play()
    }
    
    @IBAction func playAsChipmunk(sender: AnyObject) {
        print("I'm a chipmunk!")
        playAudioWithVariablePitch(1000)
    }
    
    @IBAction func playAsVader(sender: AnyObject) {
        print("I want to sound like your father")
        playAudioWithVariablePitch(-800)
    }
    
    @IBAction func stopSound(sender: AnyObject) {
        print("Stop playback please.")
        audioPlayer.stop()
    }
    
    func setPlaybackSpeed(rate: Float) {
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        audioPlayer.rate = rate
        audioPlayer.currentTime = 0.0
    }
    
    func playAudioWithVariablePitch(pitch: Float) {
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        let changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        do {
            try audioEngine.start()
        } catch _ {
			
        }
        
        audioPlayerNode.play()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
