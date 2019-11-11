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
    
    public func matchAll(_ str: String,
                         options: NSRegularExpression.MatchingOptions = [] ) -> AGMatchList {

        let matched = regex.matches(
                        in: str,
                        options: options,
                        range: NSRange(location: 0, length: str.count))

                for index in 0 ..< $0.numberOfRanges {
                    group.append(str[$0.range(at: index)])
                }

                return AGMatch(start: $0.range.lowerBound,
                               end: $0.range.upperBound,
                               base: str,
                               groups: group)
            }

            return AGMatch(start: $0.range.lowerBound, end: $0.range.upperBound,
                     base: str, groups: group)
        }

        return AGMatchList(base: str, matching: mapped)
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

    public func getIterator(_ str: String) -> AGMatchLazyListIterator {
        return AGMatchLazyList(withBase: str, regex: self.regex).makeIterator()
    }
}
