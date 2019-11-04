//
//  AGRegexTest.swift
//  AGString-iOS
//
//  Created by tskim on 2019/11/04.
//  Copyright © 2019 AGString. All rights reserved.
//


@testable import AGString
import XCTest

class AGRegexTest: XCTestCase {
    
    func testFindAll() {
        let regex = AGRegex("ai")
        let str = "The rain in Spain"
        let actual = regex.findAll(str)
        let expect = [
            AGMatch(start: 5, end: 7, base: str, groups: []),
            AGMatch(start: 14, end: 16, base: str, groups: []),
        ]
        XCTAssertEqual(actual, expect)
    }
    
    func testFirstMatch() {
        let regex = AGRegex("ai")
        let str = "The rain in Spain"
        let actual = regex.first
        let expect = AGMatch(start: 5, end: 7, base: str, groups: [])
        XCTAssertEqual(actual, expect)
    }
    
    func testLastMatch() {
        let regex = AGRegex("ai")
        let str = "The rain in Spain"
        let actual = regex.last
        let expect = AGMatch(start: 14, end: 16, base: str, groups: [])
        XCTAssertEqual(actual, expect)
    }
    
    func testSub() {
        let regex = AGRegex("\\s")
        let str = "The rain in Spain"
        let actual = regex.sub(str: str, replace: "9")
        let expect = "The9rain9in9Spain"
        XCTAssertEqual(actual, expect)
    }
    
    func testSubWithCount() {
        let regex = AGRegex("\\s")
        let str = "The rain in Spain"
        let actual = regex.sub(str: str, replace: "9", count: 2)
        let expect = "The9rain9in Spain"
        XCTAssertEqual(actual, expect)
    }
    
    func testFindIter() {
        let regex = AGRegex("([A-Z]+)([0-9]+)")
        let str = "ABC12DEF3G56HIJ7"
        
        
        let expects = [
            "12 * ABC",
            "3 * DEF",
            "56 * G",
            "7 * HIJ"
        ]
        
        var testCount = 0
        for (i, m) in regex.finditer(str).enumerated() {
            let actual = "\(m.group(2)) * \(m.group(1))"
            let expect = expects[i]
            XCTAssertEqual(actual, expect)
            testCount += 1
        }
        
        XCTAssertEqual(testCount, 4)
    }
}

extension AGMatch: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.base == rhs.base &&
            lhs.start == rhs.start &&
            lhs.end == rhs.end &&
            lhs.groupCount == rhs.groupCount
    }
}
