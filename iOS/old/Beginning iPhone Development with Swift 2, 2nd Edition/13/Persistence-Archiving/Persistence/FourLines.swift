//
//  FourLines.swift
//  Persistence
//
//  Created by andyron on 16/9/1.
//  Copyright © 2016年 andyron. All rights reserved.
//

import Foundation


class FourLines : NSObject, NSCoding, NSCopying {
    private static let linesKey = "linesKey"
    var lines:[String]?
    override init() {
    }
    required init(coder decoder: NSCoder) {
        lines = decoder.decodeObjectForKey(FourLines.linesKey) as? [String]
    }
    func encodeWithCoder(coder: NSCoder) {
        if let saveLines = lines {
            coder.encodeObject(saveLines, forKey: FourLines.linesKey)
        }
    }
    func copyWithZone(zone: NSZone) -> AnyObject {
        let copy = FourLines()
        if let linesToCopy = lines {
            var newLines = Array<String>()
            for line in linesToCopy {
                newLines.append(line)
            }
            copy.lines = newLines
        }
        return copy }
}