//
//  AGMatch.swift
//  AGString-iOS
//
//  Created by tskim on 2019/11/04.
//  Copyright © 2019 AGString. All rights reserved.
//

import Foundation

public typealias AGSpan = NSRange

public struct AGMatch: Equatable {
    let start: Int
    let end: Int
    private let groups: [String]

    public init(start: Int, end: Int, base: String, groups: [String]) {
        self.start = start
        self.end = end
        self.groups = groups
    }
}

extension AGMatch {
    public var groupCount: Int {
        return groups.count
    }

    public func group(_ index: Int = 0) -> String {
        guard index < groups.count else {
            return ""
        }

        return groups[index]
    }

    public var span: AGSpan {
        return NSRange(location: start, length: start + end)
    }
}
