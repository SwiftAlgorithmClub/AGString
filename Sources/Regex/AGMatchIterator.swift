//
//  AGMatchIterator.swift
//  AGString-iOS
//
//  Created by tskim on 2019/11/04.
//  Copyright © 2019 AGString. All rights reserved.
//

import Foundation

struct AGMatchIterator: IteratorProtocol {
    typealias Element = AGMatch
    
    mutating func next() -> AGMatchIterator.Element? {
        return nil
    }
}
