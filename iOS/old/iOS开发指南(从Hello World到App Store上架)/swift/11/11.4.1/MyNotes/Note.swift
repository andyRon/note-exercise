//
//  Note.swift
//  MyNotes
//
//  Created by andyron on 2016/12/19.
//  Copyright © 2016年 andyron. All rights reserved.
//

import Foundation

class Note {
    var date: Date
    var content: String
    
    init(date:Date, content:String) {
        self.date = date
        self.content = content
    }
    init() {
        self.date = Date()
        self.content = ""
    }
}
