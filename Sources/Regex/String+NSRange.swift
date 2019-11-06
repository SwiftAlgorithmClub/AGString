//
//  String+NSRange.swift
//  AGString-iOS
//
//  Created by 조수환 on 2019/11/06.
//  Copyright © 2019 AGString. All rights reserved.
//

import Foundation

extension String {
  public func range(with range: NSRange) -> Range<String.Index> {
    let begin = index(startIndex, offsetBy: range.location)
    let end = index(startIndex, offsetBy: range.location + range.length)
    return begin..<end
  }

  public subscript(range: NSRange) -> String {
    return String(self[self.range(with: range)])
  }
}
