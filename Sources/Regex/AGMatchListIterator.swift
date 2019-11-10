//
//  AGMatchIterator.swift
//  AGString-iOS
//
//  Created by tskim on 2019/11/04.
//  Copyright © 2019 AGString. All rights reserved.
//

import Foundation

public struct AGMatchListIterator: IteratorProtocol {
    public typealias Element = AGMatch

    var iterator: IndexingIterator<[AGMatch]>
    public mutating func next() -> AGMatchListIterator.Element? {
        return iterator.next()
    }

    init(_ iterator: IndexingIterator<[AGMatch]>) {
        self.iterator = iterator
    }
}
