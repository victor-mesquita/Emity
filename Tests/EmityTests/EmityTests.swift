//
//  EmityTests.swift
//  Emity
//
//  Created by Victor Mesquita on 12/01/2019.
//  Copyright © 2019 Emity. All rights reserved.
//

import Foundation
import XCTest
import Emity

class EmityTests: XCTestCase {
    var emity: EventEmitter? = nil
    
    override func setUp() {
        super.setUp()
        
        emity = EventEmitter()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShouldWorkWithNilData() {
        emity?.on(eventName: "dataNil", fn: { data in
            XCTAssertTrue(data == nil)
        })
        
        emity?.emit(eventName: "dataNil", data: nil)
    }
    
    func testShouldWorkWithNumberData() {
        emity?.on(eventName: "dataInt", fn: { data in
            XCTAssertTrue((data as? Int) == 0)
        })
        
        emity?.on(eventName: "dataDouble", fn: { data in
            XCTAssertTrue((data as? Double) == 0.0)
        })
        
        emity?.emit(eventName: "dataInt", data: 0)
        emity?.emit(eventName: "dataDouble", data: 0.0)
    }
    
    
    func testShouldEmitToAllListenersWithNoData() {
        var witness: [Int] = [Int]()
        
        emity?.on(eventName: "moreThanOneListener", fn: {
            witness.append(1)
        })
        
        emity?.on(eventName: "moreThanOneListener", fn: {
            witness.append(2)
        })
        
        emity?.emit(eventName: "moreThanOneListener")
        
        XCTAssertTrue(witness.count == 2)
    }
    
    
    func testShouldEmitToAllListenersWithData() {
        var witness: [Int] = [Int]()
        
        emity?.on(eventName: "moreThanOneListenerWithData", fn: { data in
            if(data != nil) {
                witness.append(2)
            }
        })
        
        emity?.on(eventName: "moreThanOneListenerWithData", fn: { data in
            if(data != nil) {
                witness.append(2)
            }
        })
        
        emity?.emit(eventName: "moreThanOneListenerWithData", data: 0)
        
        XCTAssertTrue(witness.count == 2)
    }
}
