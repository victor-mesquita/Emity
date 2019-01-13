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
        emity?.on("dataNil", fn: { data in
            XCTAssertTrue(data == nil)
        })
        
        emity?.emit("dataNil", data: nil)
    }
    
    func testShouldWorkWithNumberData() {
        emity?.on("dataInt", fn: { data in
            XCTAssertTrue((data as? Int) == 0)
        })
        
        emity?.on("dataDouble", fn: { data in
            XCTAssertTrue((data as? Double) == 0.0)
        })
        
        emity?.emit("dataInt", data: 0)
        emity?.emit("dataDouble", data: 0.0)
    }
    
    
    func testShouldEmitToAllListenersWithNoData() {
        var witness: [Int] = [Int]()
        
        emity?.on("moreThanOneListener", fn: {
            witness.append(1)
        })
        
        emity?.on("moreThanOneListener", fn: {
            witness.append(2)
        })
        
        emity?.emit("moreThanOneListener")
        
        XCTAssertTrue(witness.count == 2)
    }
    
    
    func testShouldEmitToAllListenersWithData() {
        var witness: [Int] = [Int]()
        
        emity?.on("moreThanOneListenerWithData", fn: { data in
            if(data != nil) {
                witness.append(2)
            }
        })
        
        emity?.on("moreThanOneListenerWithData", fn: { data in
            if(data != nil) {
                witness.append(2)
            }
        })
        
        emity?.emit("moreThanOneListenerWithData", data: 0)
        
        XCTAssertTrue(witness.count == 2)
    }
}
