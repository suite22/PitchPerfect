//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Ben Goertz on 5/12/15.
//  Copyright (c) 2015 Ben Goertz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(sender: UIButton) {
        println("Yo!")
        // TODO: Record audio.
        
        // Show label when recording.
        recordLabel.hidden = false
    }
    
}

