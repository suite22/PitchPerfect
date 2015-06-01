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

    var slowPlayback = AVAudioPlayer()
    
    func setupAudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer {
        var path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        println(file)
        println(type)
        var url = NSURL.fileURLWithPath(path!)
        
        var error: NSError?
        
        var audioPlayer: AVAudioPlayer?
        audioPlayer = AVAudioPlayer(contentsOfURL: url, error: &error)
        
        return audioPlayer!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slowPlayback = self.setupAudioPlayerWithFile("movie_quote", type: "mp3")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSlow(sender: AnyObject) {
        println("yo")
        
        slowPlayback.play()
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
