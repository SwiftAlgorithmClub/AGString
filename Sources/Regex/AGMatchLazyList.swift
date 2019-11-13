//
//  AGMatchLazyList.swift
//  AGString-iOS
//
//  Created by 조수환 on 2019/11/11.
//  Copyright © 2019 AGString. All rights reserved.
//

import Foundation

public struct AGMatchLazyList: Equatable, Sequence {
    public typealias Iterator = AGMatchLazyListIterator
    public typealias Element = AGMatch

    public let baseString: String
    private let regex: NSRegularExpression
    
    init(base: String, regex: NSRegularExpression) {
        self.baseString = base
        self.regex = regex
    }

    public __consuming func makeIterator() -> AGMatchLazyList.Iterator {
        return AGMatchLazyListIterator(base: baseString,
                                       regex: self.regex)
    }
}
