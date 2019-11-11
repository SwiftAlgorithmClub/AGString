//
//  AGMatchLazyList.swift
//  AGString-iOS
//
//  Created by 조수환 on 2019/11/11.
//  Copyright © 2019 AGString. All rights reserved.
//

import Foundation

public struct AGMatchLazyList: AGMatchListProtocol {
    public typealias Iterator = AGMatchLazyListIterator

    public let baseString: String
    private let regex: NSRegularExpression

    init(withBase base: String, regex: NSRegularExpression) {
        self.baseString = base
        self.regex = regex
    }

    public var first: AGMatch? {
        let matched = regex.firstMatch(in:
                            baseString,
                            options: [],
                            range: NSRange(location: 0, length: baseString.count))

        return matched.map {
            var group: [String] = []

            for index in 0 ..< $0.numberOfRanges {
                group.append(baseString[$0.range(at: index)])
            }

            return AGMatch(start: $0.range.lowerBound,
                           end: $0.range.upperBound,
                           base: baseString,
                           groups: group)
        }
    }

    public var last: AGMatch? {
        var iterator = self.makeIterator()
        var result: AGMatch?

        while let temp = iterator.next() {
            result = temp
        }

        return result
    }

    public __consuming func makeIterator() -> AGMatchLazyList.Iterator {
        return AGMatchLazyListIterator(withBase: baseString,
                                       regex: self.regex)
    }
}
