//
//  Utility.swift
//  AGString-iOS
//
//  Created by 조수환 on 2019/11/03.
//  Copyright © 2019 AGString. All rights reserved.
//

import Foundation

extension String {
    public enum ZFillDirection {
        case left
        case right
    }
    public func zfill(_ length: Int, with character: Character = "0", direction dir: ZFillDirection = .left) -> String {
        let lengthToNeed = length - self.count

        if lengthToNeed <= 0 {
            return self
        } else {

            let str = String(repeating: character, count: lengthToNeed)
            switch dir {
            case .left:
                return str + self
            case .right:
                return self + str
            }
        }
    }
}
