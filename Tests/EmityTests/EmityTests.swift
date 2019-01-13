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
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShouldWorkWithNilData() {
        emity?.on("dataNil", callback: { data in
            XCTAssertTrue(data == nil)
        })
        
        emity?.emit("dataNil", withData: nil)
    }
    
    func testShouldWorkWithNumberData() {
        emity?.on("dataInt", callback: { data in
            XCTAssertTrue((data as? Int) == 0)
        })
        
        emity?.on("dataDouble", callback: { data in
            XCTAssertTrue((data as? Double) == 0.0)
        })
        
        emity?.emit("dataInt", withData: 0)
        emity?.emit("dataDouble", withData: 0.0)
    }
    
    
    func testShouldEmitToAllListenersWithNoData() {
        var witness: [Int] = [Int]()
        
        emity?.on("moreThanOneListener", callback: {
            witness.append(1)
        })
        
        emity?.on("moreThanOneListener", callback: {
            witness.append(2)
        })
        
        emity?.emit("moreThanOneListener")
        
        XCTAssertTrue(witness.count == 2)
    }
    
    
    func testShouldEmitToAllListenersWithData() {
        var witness: [Int] = [Int]()
        
        emity?.on("moreThanOneListenerWithData", callback: { data in
            if(data != nil) {
                witness.append(2)
            }
        })
        
        emity?.on("moreThanOneListenerWithData", callback: { data in
            if(data != nil) {
                witness.append(2)
            }
        })
        
        emity?.emit("moreThanOneListenerWithData", withData: 0)
        
        XCTAssertTrue(witness.count == 2)
    }
}
