//
//  AGRegex.swift
//  AGString-iOS
//
//  Created by tskim on 2019/11/03.
//  Copyright © 2019 AGString. All rights reserved.
//

@_exported import Foundation

class AGRegex {
    
    private let pattern: String
    private var matchResult: [AGMatch]?

    private var regex: NSRegularExpression? {
        do {
            return try NSRegularExpression(pattern: pattern)
        } catch {
            return nil
        }
    }

    init(_ pattern: String) {
        self.pattern = pattern
    }
}

extension AGRegex {
    
    func findAll(_ str: String) -> [AGMatch] {

        guard let regex = self.regex else {
            return []
        }

        if let result = matchResult {
            return result
        } else {
            let matched = regex.matches(in: str,
                                         options: [],
                                         range: NSRange(location: 0, length: str.count))

             matchResult = matched.map {
                 AGMatch(start: $0.range.lowerBound, end: $0.range.upperBound,
                         base: str, groups: [])
            }

            return matchResult ?? []
        }
    }

    func first(_ str: String) -> AGMatch? {
        guard let result = matchResult?.first else {
            return self.findAll(str).first
        }

        return result
    }

    func last(_ str: String) -> AGMatch? {
        guard let result = matchResult?.last else {
            return self.findAll(str).last
        }

        return result
    }

    func sub(str: String, replace: String, count: Int = Int.max) -> String {
        return ""
    }

    func finditer(_ str: String) -> AGMatch {
        return AGMatch(start: 0, end: 0, base: "", groups: [])
    }
}
