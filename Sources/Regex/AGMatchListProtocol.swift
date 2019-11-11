//
//  AGMatchListProtocol.swift
//  AGString-iOS
//
//  Created by 조수환 on 2019/11/11.
//  Copyright © 2019 AGString. All rights reserved.
//

import Foundation

public protocol AGMatchListProtocol: Equatable, Sequence where Element == AGMatch {

    var baseString: String { get }
    var first: AGMatch? { get }
    var last: AGMatch? { get }
}
