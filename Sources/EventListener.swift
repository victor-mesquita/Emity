//
//  EventListener.swift
//  Emity-iOS
//
//  Created by Victor Mesquita on 1/12/19.
//  Copyright © 2019 Emity. All rights reserved.
//

import Foundation

public class EventListener {
    
    var listeners = [Event]()
    
    private let _eventName: String
    
    var eventName: String {
        get {
            return _eventName
        }
    }
    
    public init(eventName: String) {
        self._eventName = eventName
    }
    
    public func add(event: Event) {
        listeners.append(event)
    }
}
