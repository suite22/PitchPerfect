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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        func setupAudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer {
            var path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
            var url = NSURL.fileURLWithPath(path!)
            
            var error: NSError?
            
            var audioPlayer: AVAudioPlayer?
            audioPlayer = AVAudioPlayer(contentsOfURL: url, error: &error)
            
            return audioPlayer!
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
    
    @IBAction func playSlow(sender: AnyObject) {
        println("yo")
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
