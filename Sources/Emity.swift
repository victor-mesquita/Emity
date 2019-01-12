//
//  Emity.swift
//  Emity
//
//  Created by Victor Mesquita on 12/01/2019.
//  Copyright © 2019 Emity. All rights reserved.
//

import Foundation

protocol EmityProtocol {
    func on(eventName: String, fn: @escaping (() -> ())) -> Void
    func on(eventName: String, fn: @escaping ((_ data: Any?) -> ())) -> Void
    func emit(eventName: String) -> Void
    func emit(eventName: String, _ data: Any?) -> Void
}

class Emity {
    private var _events = Dictionary<String, EventListener>()
    private var eventsCount: Int = 0
    
    func on(eventName: String, fn: @escaping (() -> ())) -> Void {
        on(eventName: eventName, fn: { _ in
            fn()
        });
    }
    
    func on(eventName: String, fn: @escaping ((_ data: Any?) -> ())) -> Void {
        let eventFn = Event(fn: fn);
        
        addListener(eventName: eventName, event: eventFn)
    }
    
    private func addListener(eventName: String, event: Event) {
        if let eventListener = _events[eventName] {
            eventListener.add(event: event)
        }else{
            let eventListener = EventListener(eventName: eventName)
            
            eventListener.add(event: event)
            
            _events[eventName] = eventListener
        }
    }
    
    func emit(eventName: String, data: Any?) -> Void {
        if let eventListener = self._events[eventName] {
            for event in eventListener.listeners {
                if let methodToCall = event.fn {
                    methodToCall(data);
                }
            }
        }
    }
    
    func emit(eventName: String) -> Void {
        emit(eventName: eventName, data: nil)
    }
}
