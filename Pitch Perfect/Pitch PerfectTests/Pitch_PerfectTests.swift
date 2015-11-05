//
//  Pitch_PerfectTests.swift
//  Pitch PerfectTests
//
//  Created by Ben Goertz on 5/12/15.
//  Copyright (c) 2015 Ben Goertz. All rights reserved.
//

import UIKit
import XCTest

@testable import Pitch_Perfect

class Pitch_PerfectTests: XCTestCase {
	
	var recordVC: RecordSoundViewController!
	
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
		let storyboard = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.dynamicType))
		self.recordVC = storyboard.instantiateViewControllerWithIdentifier("Record") as! RecordSoundViewController
		
		let _ = recordVC.view
		
		self.recordVC.viewDidLoad()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }

	func testRecordVC(){
		XCTAssertEqual(recordVC.stopButton.hidden, true, "The stop recording button should be hidden")
		XCTAssertEqual(recordVC.recordLabel.hidden, true, "The recording label should be hidden")
		XCTAssertEqual(recordVC.recordButton.enabled, true, "The recording button should be enabled")
		
		recordVC.recordAudio(recordVC.recordButton)
		XCTAssertEqual(recordVC.stopButton.hidden, false, "The stop recording button should be visible")
		XCTAssertEqual(recordVC.recordLabel.hidden, false, "The recording label should be visible")
		XCTAssertEqual(recordVC.recordButton.enabled, false, "The record button should be disabled")
	}
}
