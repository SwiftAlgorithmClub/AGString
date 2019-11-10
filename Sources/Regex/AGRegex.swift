//
//  AGRegex.swift
//  AGString-iOS
//
//  Created by tskim on 2019/11/03.
//  Copyright © 2019 AGString. All rights reserved.
//

@_exported import Foundation

public class AGRegex {

    private var regex: NSRegularExpression

    public init(_ regex: NSRegularExpression) {
        self.regex = regex
    }
}

extension AGRegex {
    
    public func findAll(_ str: String) -> [AGMatch] {

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

    public func first(_ str: String) -> AGMatch? {
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

    public func last(_ str: String) -> AGMatch? {
        return findAll(str).last
    }

    public func sub(str: String, replace: String, count: Int = Int.max) -> String {
        var result = str
        var replacingCount = count

        while replacingCount > 0, let matched = regex.firstMatch(
                            in: result,
                            options: [],
                            range: NSRange(location: 0, length: result.count)) {
            result.replaceSubrange(
                result.range(with: matched.range),
                with: replace)
            replacingCount -= 1
        }

        return result
    }

    public func finditer(_ str: String) -> IndexingIterator<[AGMatch]> {
        return self.findAll(str).makeIterator()
    }
}
