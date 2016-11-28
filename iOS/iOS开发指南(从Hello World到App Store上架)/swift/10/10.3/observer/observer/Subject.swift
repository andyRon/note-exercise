//
//  Subject.swift
//  observer
//
//  Created by andyron on 2016/11/28.
//  Copyright © 2016年 andyron. All rights reserved.
//

import Foundation

public protocol Subject {
    func attach() -> Void;
    func detach() -> Void;
    func notifyObserver() -> Void;
    
}



class ConcreteSubject: Subject {
    func attach() {
        
    }
    func detach() {
        
    }
    func notifyObserver() {
        
    }
}
