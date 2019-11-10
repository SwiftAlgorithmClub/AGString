//: [Previous](@previous)

import AGString

let r = try! NSRegularExpression(pattern: "([A-Z]+)([0-9]+)", options: [])
let regex = AGRegex(r)
let str = "ABC12DEF3G56HIJ7"
    

var text = ""
for (i, m) in regex.finditer(str).enumerated() {
   print("\(m.group(2)) * \(m.group(1))")
}

/*:
 ### Expects
 
 1. "12 * ABC",
 2. "3 * DEF",
 3. "56 * G",
 4. "7 * HIJ"
 */
