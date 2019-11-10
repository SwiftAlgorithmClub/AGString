//: [Previous](@previous)

import AGString


let str = "abc"

let str2 = str.zfill(10)

str2 == "0000000abc"

let str3 = str.zfill(10, with: "1", direction: .right)

str3 == "abc1111111"

//: [Next](WordCount)
