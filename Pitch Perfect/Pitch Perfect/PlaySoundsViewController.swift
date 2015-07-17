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
        
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
        
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    // MARK: IBActions
    
    @IBAction func playSlow(sender: AnyObject) {
        println("Slow it down there!")
        setPlaybackSpeed(0.5)
    }
    
    @IBAction func playFast(sender: AnyObject) {
        println("Let's play fast!")
        setPlaybackSpeed(1.5)
    }
    
    @IBAction func playAsChipmunk(sender: AnyObject) {
        println("I'm a chipmunk!")
        playAudioWithVariablePitch(1000)
    }
    
    @IBAction func playAsVader(sender: AnyObject) {
        println("I want to sound like your father")
        playAudioWithVariablePitch(-800)
    }
    
    @IBAction func stopSound(sender: AnyObject) {
        println("Stop playback please.")
        audioPlayer.stop()
    }
    
    func stopPlayback() {
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
    }
    
    func setPlaybackSpeed(rate: Float) {
        stopPlayback()
        
        audioPlayer.rate = rate
        audioPlayer.currentTime = 0.0
        
        audioPlayer.play()
    }
    
    func playAudioWithVariablePitch(pitch: Float) {
        stopPlayback()
        
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
}
