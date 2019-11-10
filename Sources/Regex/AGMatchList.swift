//
//  AGMatchList.swift
//  AGString-iOS
//
//  Created by 조수환 on 2019/11/10.
//  Copyright © 2019 AGString. All rights reserved.
//

import Foundation

public struct AGMatchList: Sequence, Equatable {
    public typealias Iterator = AGMatchListIterator
    public typealias Element = AGMatch
    
    public let baseString: String
    private let list: [Element]

    init(withBase base: String, matching matchList: [Element]) {
        baseString = base
        list = matchList
    }

    public var first: AGMatch? {
        return list.first
    }

    public var last: AGMatch? {
        return list.last
    }

    public __consuming func makeIterator() -> AGMatchList.Iterator {
        return AGMatchListIterator(list.makeIterator())
    }
}
