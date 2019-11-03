//
//  ViewController.swift
//  Example
//
//  Created by AGString on 2019. 11. 3..
//  Copyright © 2019 AGString. All rights reserved.
//

import UIKit
import AGString

// MARK: - ViewController

/// The ViewController
class ViewController: UIViewController {

    // MARK: Properties

    /// The Label
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "🚀\nAGString\nExample"
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()

    // MARK: View-Lifecycle

    /// View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        let str = "abcde"
        print(str[1..<3].utf16. 1)
//        print(type(of: str))
//        print(str[1]) // => b
//        print(str[1..<3]) // => bc
//        print(str[1...3]) // => bcd
//        print(str[1...]) // => bcde
//        print(str[...3]) // => abcd
//        print(str[..<3]) // => abc
//        print("")

//        // With substrings:
//        let sub = str[0...]
//        print(type(of: sub))
//        print(sub[1]) // => b
//        print(sub[1..<3]) // => bc
//        print(sub[1...3]) // => bcd
//        print(sub[1...]) // => bcde
//        print(sub[...3]) // => abcd
//        print(sub[..<3]) // => abc

    }

    /// LoadView
    override func loadView() {
        self.view = self.label
    }

}

extension Substring {
    var aa: String {
        return String(self)
    }
}

extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    subscript (bounds: CountableRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ..< end]
    }
    subscript (bounds: CountableClosedRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ... end]
    }
    subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(endIndex, offsetBy: -1)
        return self[start ... end]
    }
    subscript (bounds: PartialRangeThrough<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ... end]
    }
    subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ..< end]
    }
}
extension Substring {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    subscript (bounds: CountableRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ..< end]
    }
    subscript (bounds: CountableClosedRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ... end]
    }
    subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(endIndex, offsetBy: -1)
        return self[start ... end]
    }
    subscript (bounds: PartialRangeThrough<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ... end]
    }
    subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ..< end]
    }
}
