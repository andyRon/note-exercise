//
//  NoteDAO.swift
//  MyNotes
//
//  Created by andyron on 2016/12/19.
//  Copyright © 2016年 andyron. All rights reserved.
//

import Foundation

class NoteDAO {
    var listData: NSMutableArray!
    
    static let sharedInstance: NoteDAO = {
        let instance = NoteDAO()
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date1: Date = dateFormatter.date(from: "2016-12-19 22:56:14")!
        let note1: Note = Note(date: date1, content: "Welcome to MyNote")
        
        let date2: Date = dateFormatter.date(from: "2016-12-20 23:00:19")!
        let note2: Note = Note(date: date2, content: "欢迎使用MyNote。")
        
        instance.listData = NSMutableArray()
        instance.listData.addObjects(from: [note1, note2])
        return instance
    }()
    
    func create(model: Note) -> Int {
        self.listData.addObjects(from: [model])
        return 0
    }
    
    func remove(model: Note) -> Int {
        for note in self.listData {
            let note2 = note as! Note
            if note2.date == model.date {
                self.listData.remove(note)
            }
        }
        return 0
    }
    
    func modify(model: Note) -> Int {
        for note in self.listData {
            let note2 = note as! Note
            if note2.date == model.date {
                note2.content = model.content
                break
            }
        }
        return 0
    }
    
    func findAll() -> NSMutableArray {
        return self.listData
    }
    
    func findById(model: Note) -> Note? {
        for note in self.listData {
            let note2 = note as! Note
            if note2.date == model.date {
                return note2
            }
        }
        return nil
    }
    
}
