//
//  AGRegex.swift
//  AGString-iOS
//
//  Created by tskim on 2019/11/03.
//  Copyright © 2019 AGString. All rights reserved.
//

@_exported import Foundation

class AGRegex {

    private var regex: NSRegularExpression


    init(_ regex: NSRegularExpression) {
        self.regex = regex
    }
}

extension AGRegex {
    
    func findAll(_ str: String) -> [AGMatch] {

        let matched = regex.matches(
                        in: str,
                        options: [],
                        range: NSRange(location: 0, length: str.count))

         return matched.map {
            var group: [String] = []

            for index in 0 ..< $0.numberOfRanges {
                group.append(str[$0.range(at: index)])
            }

            return AGMatch(start: $0.range.lowerBound, end: $0.range.upperBound,
                     base: str, groups: group)
        }
    }

    func first(_ str: String) -> AGMatch? {
        let matched = regex.firstMatch(
                        in: str,
                        options: [],
                        range: NSRange(location: 0, length: str.count))

        return matched.map {
            var group: [String] = []

            for index in 0 ..< $0.numberOfRanges {
                group.append(str[$0.range(at: index)])
            }

            return AGMatch(start: $0.range.lowerBound, end: $0.range.upperBound,
                     base: str, groups: group)
        }

    }

    func last(_ str: String) -> AGMatch? {
        return findAll(str).last
    }

    func sub(str: String, replace: String, count: Int = Int.max) -> String {
        return ""
    }

    func finditer(_ str: String) -> AGMatch {
        return AGMatch(start: 0, end: 0, base: "", groups: [])
    }
}
