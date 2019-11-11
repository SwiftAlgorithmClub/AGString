//
//  AGMatchIterator.swift
//  AGString-iOS
//
//  Created by tskim on 2019/11/04.
//  Copyright © 2019 AGString. All rights reserved.
//

import Foundation

public struct AGMatchListIterator: AGMatchListIteratorProtocol {

    var iterator: IndexingIterator<[AGMatch]>
    public mutating func next() -> AGMatch? {
        return iterator.next()
    }

    init(_ iterator: IndexingIterator<[AGMatch]>) {
        self.iterator = iterator
    }
}
