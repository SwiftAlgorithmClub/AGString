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
        let r = try! NSRegularExpression(pattern: "ai", options: [])
        let regex = AGRegex(r)
        let str = "The rain in Spain"
        let actual = regex.matchAll(str)
        let expect = AGMatchList(base: str, matching:  [
                   AGMatch(start: 5, end: 7, base: str, groups: ["ai"]),
                   AGMatch(start: 14, end: 16, base: str, groups: ["ai"]),
               ])
        
        XCTAssertEqual(actual, expect)
    }
    
    func testFirstMatch() {
        let r = try! NSRegularExpression(pattern: "ai", options: [])
        let regex = AGRegex(r)
        let str = "The rain in Spain"
        let actual = regex.matchAll(str).first
        let expect = AGMatch(start: 5, end: 7, base: str, groups: ["ai"])
        XCTAssertEqual(actual, expect)
    }
    
    func testLastMatch() {
        let r = try! NSRegularExpression(pattern: "ai", options: [])
        let regex = AGRegex(r)
        let str = "The rain in Spain"
        let actual = regex.matchAll(str).last
        let expect = AGMatch(start: 14, end: 16, base: str, groups: ["ai"])
        XCTAssertEqual(actual, expect)
    }
    
    func testSub() {
        let r = try! NSRegularExpression(pattern: "\\s", options: [])
        let regex = AGRegex(r)
        let str = "The rain in Spain"
        let actual = regex.sub(str: str, replace: "9")
        let expect = "The9rain9in9Spain"
        XCTAssertEqual(actual, expect)
    }
    
    func testSubWithCount() {
        let r = try! NSRegularExpression(pattern: "\\s", options: [])
        let regex = AGRegex(r)
        let str = "The rain in Spain"
        let actual = regex.sub(str: str, replace: "9", count: 2)
        let expect = "The9rain9in Spain"
        XCTAssertEqual(actual, expect)
    }
    
    func testFindIter() {
        let r = try! NSRegularExpression(pattern: "([A-Z]+)([0-9]+)", options: [])
        let regex = AGRegex(r)
        let str = "ABC12DEF3G56HIJ7"
        
        
        let expects = [
            "12 * ABC",
            "3 * DEF",
            "56 * G",
            "7 * HIJ"
        ]
        
        var testCount = 0
        var iterator = regex.getIterator(str)
        var index = 0
        while let m = iterator.next() {
            let actual = "\(m.group(2)) * \(m.group(1))"
            let expect = expects[index]
            XCTAssertEqual(actual, expect)
            testCount += 1
            index += 1
        }
        
        XCTAssertEqual(testCount, 4)
    }
}
