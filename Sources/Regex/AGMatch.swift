//
//  AGMatch.swift
//  AGString-iOS
//
//  Created by tskim on 2019/11/04.
//  Copyright © 2019 AGString. All rights reserved.
//

import Foundation

typealias AGSpan = (Int, Int)
struct AGMatch {
    let start: Int
    let end: Int
    let spacn: (AGSpan)
    let base: String
    private let groups: [String]
}

extension AGMatch {
    var groupCount: Int {
        return 0
    }
    func group(_ index: Int) -> String {
        return ""
    }
    
    func group() -> String {
        return ""
    }
}
