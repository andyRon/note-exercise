//
//  NoteBL.swift
//  MyNotes
//
//  Created by andyron on 2016/12/19.
//  Copyright © 2016年 andyron. All rights reserved.
//

import Foundation

class NoteBL {
    
    func createNote(model: Note) -> NSMutableArray {
        let dao:NoteDAO = NoteDAO.sharedInstance
        dao.create(model: model)
        return dao.findAll()
    }
    
    func remove(model: Note) -> NSMutableArray {
        let dao:NoteDAO = NoteDAO.sharedInstance
        dao.remove(model: model)
        return dao.findAll()
    }
    
    func findAll() -> NSMutableArray {
        let dao:NoteDAO = NoteDAO.sharedInstance
        return dao.findAll()
    }
}
