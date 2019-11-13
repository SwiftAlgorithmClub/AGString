<p align="center">
   <img width="300" src="https://github.com/SwiftAlgorithmClub/AGResources/blob/master/Banner.png" alt="AGString Logo"></p>
<p align="center">
   <a href="https://developer.apple.com/swift/">
      <img src="https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat" alt="Swift 5.0">
   </a>
   <a href="http://cocoapods.org/pods/AGString">
      <img src="https://img.shields.io/cocoapods/v/AGString.svg?style=flat" alt="Version">
   </a>
   <a href="http://cocoapods.org/pods/AGString">
      <img src="https://img.shields.io/cocoapods/p/AGString.svg?style=flat" alt="Platform">
   </a>
   <a href="https://github.com/Carthage/Carthage">
      <img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" alt="Carthage Compatible">
   </a>
   <a href="https://github.com/apple/swift-package-manager">
      <img src="https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg" alt="SPM">
   </a>
</p>

<p align="center">
   <a href="https://travis-ci.com/SwiftAlgorithmClub/AGString">
      <img src="https://travis-ci.com/SwiftAlgorithmClub/AGString.svg?branch=master" alt="SPM">   </a>
   <a href="https://codecov.io/gh/SwiftAlgorithmClub/AGString">
      <img src="https://codecov.io/gh/SwiftAlgorithmClub/AGString/branch/develop/graph/badge.svg" alt="SPM">
   </a>
      <a href="https://sonarcloud.io/dashboard?id=SwiftAlgorithmClub_AGString">
      <img src="https://sonarcloud.io/api/project_badges/measure?project=SwiftAlgorithmClub_AGString&metric=alert_status" alt="SonarSwift">
   </a>
</p>

# AGString
<p align="center">
AGString is an extension for convenient working with swift String.  
</p>
<p align="center">
AGRegex is Wrapper of NSRegularExpression. It gives an easy and iterative way to use RegularExpression. 
 </p>
 
## Features
- AGString gives 'String type' to 'Int-Index' based referencing
    
    * :white_check_mark: Get Character object with Int index
    * :white_check_mark: Get substring object with Range<Int>
    * :white_check_mark: String utility methods(zfill, countOccurence, ltrim,rtrim ...)
    
- AGRegex 
    
    * :white_check_mark: Provide NSRange extension for String
    * :white_check_mark: Get All Match Result as AGMatch structure. 
    * :white_check_mark: Support iterative way to use match result
    * :white_check_mark: Substitute matched string to other string 
    
## Example
The example application is the best way to see `AGString` in action. Simply open the `AGString.xcodeproj` and run the `Example` scheme.
## Installation
### CocoaPods
AGString is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:
```bash
pod 'AGString'
```
### Carthage
[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.
To integrate AGString into your Xcode project using Carthage, specify it in your `Cartfile`:
```ogdl
github "SwiftAlgorithmClub/AGString"
```
Run `carthage update` to build the framework and drag the built `AGString.framework` into your Xcode project. 
On your application targets’ “Build Phases” settings tab, click the “+” icon and choose “New Run Script Phase” and add the Framework path as mentioned in [Carthage Getting started Step 4, 5 and 6](https://github.com/Carthage/Carthage/blob/master/README.md#if-youre-building-for-ios-tvos-or-watchos)
## AGString Usage
### Slicing
```swift
var str = "Hello, World!"
str[1..<3]  // "el"
str[7...9]  // "Wor"
str[7...]   // "World!"
str[..<5]   // "Hello"
str[...5]   // "Hello,"
```
### CharAt
```swift
var str = "Hello, World!"
str[1] // "e"
```
### Trim
```swift
"     abcd    ".trimLeft()
// "abcd    "
"     abcd    ".trimRight() 
// "     abcd"
"     abcd    ".trim()
//"abcd"
```
### WordCount
```swift
let str = "like in like"
str.occurence(of: "like")   //  2
```
### Zfill
```swift
let str = "abc"
str.zfill(10)                                 // "0000000abc"
str.zfill(10, with: "1", direction: .right)   // "abc1111111"
```
## AGRegex Usage
### FindAll
```swift
let r = try! NSRegularExpression(pattern: "ai", options: [])
let regex = AGRegex(r)
regex.findAll("The rain in Spain")
/* 
[
  AGMatch(start: 5, end: 7, base: str, groups: ["ai"]),
  AGMatch(start: 14, end: 16, base: str, groups: ["ai"]),
]
*/
```
### First 
```swift
let r = try! NSRegularExpression(pattern: "ai", options: [])
let regex = AGRegex(r)
regex.first("The rain in Spain")
// AGMatch(start: 5, end: 7, base: str, groups: ["ai"])
```
### Last 
```swift
let r = try! NSRegularExpression(pattern: "ai", options: [])
let regex = AGRegex(r)
regex.last("The rain in Spain")
// AGMatch(start: 14, end: 16, base: str, groups: ["ai"])
```
### Sub 
```swift
let r = try! NSRegularExpression(pattern: "ai", options: [])
let regex = AGRegex(r)
regex.last("The rain in Spain")
// AGMatch(start: 14, end: 16, base: str, groups: ["ai"])
let r = try! NSRegularExpression(pattern: "\\s", options: [])
let regex = AGRegex(r)
regex.sub(str: "The rain in Spain", replace: "9")
// The9rain9in9Spain
regex.sub(str: str, replace: "9", count: 2)
subWithCount == "The9rain9in Spain"
// "The9rain9in Spain"
```
### FindIter 
```swift
let r = try! NSRegularExpression(pattern: "([A-Z]+)([0-9]+)", options: [])
let regex = AGRegex(r)
for m in regex.finditer("ABC12DEF3G56HIJ7") {
   print("\(m.group(2)) * \(m.group(1))")
}
/*
 "12 * ABC",
 "3 * DEF",
 "56 * G",
 "7 * HIJ"
 */
```
## Contributing
Contributions are very welcome 🙌
## License
AGString is released under the MIT license. See LICENSE for details.
