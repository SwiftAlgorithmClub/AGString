//: [Previous](@previous)

import AGString

let r = try! NSRegularExpression(pattern: "\\s", options: [])
let regex = AGRegex(r)
let str = "The rain in Spain"
let sub = regex.sub(str: str, replace: "9")

sub == "The9rain9in9Spain"

let subWithCount = regex.sub(str: str, replace: "9", count: 2)


subWithCount == "The9rain9in Spain"


//: [Next](FindIter)
