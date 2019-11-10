//: [Previous](@previous)

import AGString

let r = try! NSRegularExpression(pattern: "ai", options: [])
let regex = AGRegex(r)
let str = "The rain in Spain"
let actual = regex.findAll(str)
let expect = [
    AGMatch(start: 5, end: 7, base: str, groups: ["ai"]),
    AGMatch(start: 14, end: 16, base: str, groups: ["ai"]),
]

actual == expect

//: [Next](@next)
