//
//  Utility.swift
//  AGString-iOS
//
//  Created by 조수환 on 2019/11/03.
//  Copyright © 2019 AGString. All rights reserved.
//

import Foundation

extension String {
    func zfill(with character: Character = "0", totalLength length: Int) -> String {
        let lengthToNeed = length - self.count

        if lengthToNeed <= 0 {
            return self
        } else {
            return String(repeating: character, count: lengthToNeed) + self
        }
    }
}
