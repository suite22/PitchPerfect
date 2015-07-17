//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Ben Goertz on 7/10/15.
//  Copyright (c) 2015 Ben Goertz. All rights reserved.
//

import Foundation

class RecordedAudio {
    var filePathUrl: NSURL!
    var title: String!
    
    init(filePathUrl: NSURL, title: String) {
        self.filePathUrl = filePathUrl
        self.title = title
    }
}