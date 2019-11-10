//
//  AGMatch.swift
//  AGString-iOS
//
//  Created by tskim on 2019/11/04.
//  Copyright © 2019 AGString. All rights reserved.
//

import Foundation

public typealias AGSpan = (Int, Int)

public struct AGMatch {
    let start: Int
    let end: Int
    let base: String
    private let groups: [String]

    public init(start: Int, end: Int, base: String, groups: [String]) {
        self.start = start
        self.end = end
        self.base = base
        self.groups = groups
    }
}

extension AGMatch {
    public var groupCount: Int {
        return groups.count
    }
    public func group(_ index: Int) -> String {
        guard index < groups.count else {
            return ""
        }

        return groups[index]
    }

    public func group() -> String {
        guard let result = groups.first else {
            return ""
        }

        return result
    }
    public var span: AGSpan {
        return (start, end)
    }
}
