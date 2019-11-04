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
    
    init(_ pattern: String) {
        self.pattern = pattern
    }
}

extension AGRegex {
    
    func findAll(_ str: String) -> [AGMatch] {
        return []
    }

    var first: AGMatch? {
        return nil
    }
    var last: AGMatch? {
        return nil
    }

    func sub(str: String, replace: String, count: Int = Int.max) -> String {
        return ""
    }

    func finditer(_ str: String) -> AGMatch {
        return AGMatch(start: 0, end: 0, base: "", groups: [])
    }
}
