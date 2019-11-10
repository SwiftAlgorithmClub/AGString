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

    func testZfill() {
        let str = "abc"

        let str2 = str.zfill(2)
        XCTAssert(str2 == "abc")

        let str3 = str.zfill(3)
        XCTAssert(str3 == "abc")

        let str4 = str.zfill(10)
        XCTAssert(str4 == "0000000abc")

        let str5 = str.zfill(10, with: "x")
        XCTAssert(str5 == "xxxxxxxabc")
    }

    func testOccurence() {
        let str = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

        XCTAssert(str.occurence(of: " ") == 68)

        let str2 = String(repeating: "a", count: 1000)
        measure {
            str2.occurence(of: "a")
        }
    }

    func testLtrim() {

        XCTAssert("     abcd    ".trimLeft() == "abcd    ")
        XCTAssert("    abcd".trimLeft() == "abcd")
        XCTAssert("".trimLeft() == "")
        XCTAssert("abcd    ".trimLeft() == "abcd    ")
        XCTAssert("Hello, World!".trimLeft() == "Hello, World!")
        let str = "                                                                             a"
        measure {
            str.trimLeft()
        }
    }

    func testRtrim() {

        XCTAssert("    abcd    ".trimRight() == "    abcd")
        XCTAssert("    abcd".trimRight() == "    abcd")
        XCTAssert("".trimRight() == "")
        XCTAssert("abcd    ".trimRight() == "abcd")
        XCTAssert("Hello, World!".trimRight() == "Hello, World!")
        let str = "a                                                                             "
        measure {
            str.trimRight()
        }
    }

    func testTrim() {
        XCTAssert("    abcd    ".trim() == "abcd")
        XCTAssert("    abcd".trim() == "abcd")
        XCTAssert("".trim() == "")
        XCTAssert("abcd    ".trim() == "abcd")
        XCTAssert("Hello, World!".trim() == "Hello, World!")
        let str = "                                           a                                  "
        measure {
            str.trim()
        }
    }
}
