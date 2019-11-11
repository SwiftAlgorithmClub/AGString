//
//  AGMatchLazyListIterator.swift
//  AGString-iOS
//
//  Created by 조수환 on 2019/11/11.
//  Copyright © 2019 AGString. All rights reserved.
//

import Foundation

public struct AGMatchLazyListIterator: AGMatchListIteratorProtocol {

    private let baseString: String
    private let regex: NSRegularExpression
    private var offset: Int = 0

    public mutating func next() -> AGMatch? {
        guard let matched = regex.firstMatch(
            in: baseString,
            options: [],
            range: NSRange(location: offset, length: baseString.count - offset))
            else { return nil }

        var group: [String] = []

        for index in 0 ..< matched.numberOfRanges {
            let interpolated = NSRange(
                location: matched.range(at: index).lowerBound,
                length: matched.range(at: index).length)

                group.append(baseString[interpolated])
        }

        let result = AGMatch(
                start: matched.range.lowerBound,
                end: matched.range.upperBound,
                base: baseString,
                groups: group)

        self.offset = matched.range.upperBound

        return result
    }

    init(withBase base: String, regex: NSRegularExpression) {
        self.baseString = base
        self.regex = regex
    }
}
