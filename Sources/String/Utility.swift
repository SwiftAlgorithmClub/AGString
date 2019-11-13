//
//  Utility.swift
//  AGString-iOS
//
//  Created by 조수환 on 2019/11/03.
//  Copyright © 2019 AGString. All rights reserved.
//

import Foundation

// MARK: - ZFill
extension String {
    public enum ZFillDirection {
        case left
        case right
    }
    public func zfill(_ length: Int, with character: Character = "0", direction dir: ZFillDirection = .left) -> String {
        let lengthToNeed = length - self.count

        if lengthToNeed <= 0 {
            return self
        } else {

            let str = String(repeating: character, count: lengthToNeed)
            switch dir {
            case .left:
                return str + self
            case .right:
                return self + str
            }
        }
    }

}

// MARK: - occurence counting
extension String {

    public func occurence(of str: String) -> Int {
        let length = self.count
        let strLength = str.count

        var result = 0

        // partial[i] = N의 길이가 i인 접두사의 접두사도 되고 접미사도 되는 문자열의 최대 길이
        let partial: [Int] = str.partial()

        var begin = 0
        var matched = 0

        while begin <= length - strLength {
            let hIndex = self.index(self.startIndex, offsetBy: begin+matched)
            let nIndex = str.index(self.startIndex, offsetBy: matched)

            if matched < strLength, self[hIndex] == str[nIndex] {
                matched += 1

                if matched == strLength {
                    result += 1
                }
            } else {
                if matched == 0 {
                    begin += 1
                } else {
                    begin += (matched - partial[matched - 1])

                    matched = partial[matched - 1]
                }
            }
        }

        return result
    }

    fileprivate func partial() -> [Int] {
        let length = self.count
        var result = Array(repeating: 0, count: length)

        var begin = 1
        var matched = 0

        while begin + matched < length {
            let postfixIndex = self.index(startIndex, offsetBy: begin + matched)
            let prefixIndex = self.index(startIndex, offsetBy: matched)

            if self[prefixIndex] == self[postfixIndex] {
                matched += 1
                result[begin + matched - 1] = matched
            } else {
                if matched == 0 {
                    begin += 1
                } else {
                    begin += matched - result[matched - 1]
                    matched = result[matched - 1]
                }
            }
        }

        return result
    }
}

// MARK: - trimming(left,right,both)
extension String {
    public func trimLeft() -> String {
        if self.isEmpty {
            return ""
        }

        var cursor = 0

        while cursor < self.count, self[cursor].isWhitespace {
            cursor += 1
        }

        if cursor == self.count {
            return ""
        } else {
            return self[cursor...]
        }
    }

    public func trimRight() -> String {
        if self.isEmpty {
            return ""
        }

        var cursor = self.count-1

        while cursor >= 0, self[cursor].isWhitespace {
            cursor -= 1
        }

        if cursor < 0 {
            return ""
        } else {
            return self[...cursor]
        }
    }

    public func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}

// MARK: - Slicing using characters

extension String {

    /// Returns a sliced string of given string
    /// from the first `start` character to the last `end` character.
    ///
    /// If the lower bound is greater than the upper bound, it returns an empty string.
    /// If the given string doesn't contain given characters, it also returns an empty string.
    ///
    /// - Parameters:
    ///   - start:    The character value being the lower bound of the given string.
    ///   - end:      The character value being the upper bound of the given string.
    ///   - inversed: A boolean value that indicates whether the sliced string is inversed.
    ///               The Default value is `false`.
    ///
    /// - Returns: A sliced string of given string.
    public func sliced(from start: Character, to end: Character, inversed: Bool = false) -> String {
         guard let startCharacterIndex = firstIndex(of: start),
             let endCharacterIndex = lastIndex(of: end),
             startCharacterIndex <= endCharacterIndex
             else { return "" }
         let slicedSubstring = self[startCharacterIndex ... endCharacterIndex]
         return !inversed ? String(slicedSubstring) : String(slicedSubstring.reversed())
    }

    /// Slices a given string
    /// from the first `start` character to the last `end` character.
    ///
    /// If the lower bound is greater than the upper bound, it becomes an empty string.
    /// If the given string doesn't contain given characters, it also becomes an emtpy string.
    ///
    /// - Parameters:
    ///   - start:    The character value being the lower bound of the given string.
    ///   - end:      The character value being the upper bound of the given string.
    ///   - inversed: A boolean value that indicates whether the sliced string is inversed.
    ///               The Default value is `false`.
    public mutating func slice(from start: Character, to end: Character, inversed: Bool = false) {
        guard let startCharacterIndex = firstIndex(of: start),
            let endCharacterIndex = lastIndex(of: end),
            startCharacterIndex <= endCharacterIndex else {
                self = ""
                return
        }
        let slicedSubstring = self[startCharacterIndex ... endCharacterIndex]
        self = !inversed ? String(slicedSubstring) : String(slicedSubstring.reversed())
    }
}
