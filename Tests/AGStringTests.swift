//
//  AGStringTests.swift
//  AGStringTests
//
//  Created by AGString on 2019. 11. 3..
//  Copyright © 2019 AGString. All rights reserved.
//

@testable import AGString
import XCTest

class AGStringTests: XCTestCase {
    
    static var allTests = [
        ("testExample", testExample),
    ]
    
    func testExample() {
        var str = "Hello, World!"

        XCTAssert(str[1] == "e")
        XCTAssert(str[1..<3] == "el")
        XCTAssert(str[7...9] == "Wor")
        XCTAssert(str[7...] == "World!")
        XCTAssert(str[..<5] == "Hello")
        XCTAssert(str[...5] == "Hello,")

        str[1] = "a"
        XCTAssert(str == "Hallo, World!")

        str[1..<6] = "uge"
        XCTAssert(str == "Huge World!")

        str[5...7] = "Go"
        XCTAssert(str == "Huge Gold!")

        str[9...] = "!!!"
        XCTAssert(str == "Huge Gold!!!")

        str[..<4] = "Good"
        XCTAssert(str == "Good Gold!!!")

        str[...3] = "Goodbye"
        XCTAssert(str == "Goodbye Gold!!!")

    }
    
    func testFailRange() {
        var str = "Hello, World!"
        XCTAssert(str[0..<100] == "Hello, World!")
    }
}
