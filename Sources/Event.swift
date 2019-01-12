//
//  Event.swift
//  Emity-iOS
//
//  Created by Victor Mesquita on 1/12/19.
//  Copyright © 2019 Emity. All rights reserved.
//

import Foundation

class Event {
    let fn: ((_ data: Any?) -> ())?
    
    init(fn: @escaping ((_ data: Any?) -> ())) {
        self.fn = fn
    }
}

