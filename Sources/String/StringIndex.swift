//
//  StringIndex.swift
//  AGString-iOS
//
//  Created by 조수환 on 2019/11/03.
//  Copyright © 2019 AGString. All rights reserved.
//

import Foundation

extension String {
    public subscript(index: Int) -> Character {
        set {
            let begin = self.index(startIndex, offsetBy: index)
            let end = self.index(begin, offsetBy: 1)
            self.replaceSubrange(begin ..< end, with: [newValue])
        }
        get {
            return self[self.index(self.startIndex, offsetBy: index)]
        }
    }

    public subscript(bounds: CountableRange<Int>) -> String {
        set {
            let begin = index(startIndex, offsetBy: bounds.lowerBound)
            let end = index(startIndex, offsetBy: bounds.upperBound)

            self.replaceSubrange(begin ..< end, with: newValue)
        }
        get {
            let begin = index(startIndex, offsetBy: bounds.lowerBound)
            let end = index(startIndex, offsetBy: bounds.upperBound)

            return String(self[begin ..< end])
        }
    }

    public subscript(bounds: CountableClosedRange<Int>) -> String {
        set {
            let begin = index(startIndex, offsetBy: bounds.lowerBound)
            let end = index(startIndex, offsetBy: bounds.upperBound)

            self.replaceSubrange(begin ... end, with: newValue)
        }
        get {
            let begin = index(startIndex, offsetBy: bounds.lowerBound)
            let end = index(startIndex, offsetBy: bounds.upperBound)

            return String(self[begin ... end])
        }
    }

    public subscript(bounds: CountablePartialRangeFrom<Int>) -> String {
        set {
            let begin = index(startIndex, offsetBy: bounds.lowerBound)

            self.replaceSubrange(begin ..< endIndex, with: newValue)
        }
        get {
            let begin = index(startIndex, offsetBy: bounds.lowerBound)

            return String(self[begin ..< endIndex])
        }
    }

    public subscript(bounds: PartialRangeThrough<Int>) -> String {
        set {
            let end = index(startIndex, offsetBy: bounds.upperBound)

            self.replaceSubrange(startIndex ... end, with: newValue)
        }
        get {
            let end = index(startIndex, offsetBy: bounds.upperBound)

            return String(self[startIndex ... end])
        }
    }

    public subscript(bounds: PartialRangeUpTo<Int>) -> String {
        set {
            let end = index(startIndex, offsetBy: bounds.upperBound)

            self.replaceSubrange(startIndex ..< end, with: newValue)
        }
        get {
            let end = index(startIndex, offsetBy: bounds.upperBound)

            return String(self[startIndex ..< end])
        }
    }

}
