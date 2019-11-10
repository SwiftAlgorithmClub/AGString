//: [Previous](@previous)

import AGString

let r = try! NSRegularExpression(pattern: "ai", options: [])
let regex = AGRegex(r)
let str = "The rain in Spain"
let first = regex.first(str)

first

/*:
 ### Expects
 
 * AGMatch(start: 5, end: 7, base: str, groups: ["ai"])
 
 */


let last = regex.last(str)

last

/*:
### Expects

* AGMatch(start: 14, end: 16, base: str, groups: ["ai"])

*/


//: [Next](Sub)
