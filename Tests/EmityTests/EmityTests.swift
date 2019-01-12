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
    var emity: Emity? = nil
    
    override func setUp() {
        super.setUp()
        
        emity = Emity()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
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
