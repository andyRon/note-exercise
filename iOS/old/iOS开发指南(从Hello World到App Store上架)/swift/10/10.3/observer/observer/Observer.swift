//
//  Observer.swift
//  observer
//
//  Created by andyron on 2016/11/28.
//  Copyright © 2016年 andyron. All rights reserved.
//

import Foundation

public protocol Observer {
    func update() -> Void;
}


class ConcreteObserver: Observer {
    func update() {
        
    }
}
