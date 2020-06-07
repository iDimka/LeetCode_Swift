//
//  Atoi.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 6/4/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

/*
 https://leetcode.com/explore/interview/card/facebook/5/array-and-strings/3009/

 Implement atoi which converts a string to an integer.

 The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character, takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.

 The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.

 If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.

 If no valid conversion could be performed, a zero value is returned.

 Note:

 Only the space character ' ' is considered as whitespace character.
 Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. If the numerical value is out of the range of representable values, INT_MAX (231 − 1) or INT_MIN (−231) is returned.
 Example 1:

 Input: "42"
 Output: 42
 Example 2:

 Input: "   -42"
 Output: -42
 Explanation: The first non-whitespace character is '-', which is the minus sign.
              Then take as many numerical digits as possible, which gets 42.
 Example 3:

 Input: "4193 with words"
 Output: 4193
 Explanation: Conversion stops at digit '3' as the next character is not a numerical digit.
 Example 4:

 Input: "words and 987"
 Output: 0
 Explanation: The first non-whitespace character is 'w', which is not a numerical
              digit or a +/- sign. Therefore no valid conversion could be performed.
 Example 5:

 Input: "-91283472332"
 Output: -2147483648
 Explanation: The number "-91283472332" is out of the range of a 32-bit signed integer.
              Thefore INT_MIN (−231) is returned.
 */
class Atoi: NSObject {
  func myAtoi(_ str: String) -> Int {
    var str = str.trimmingCharacters(in: .whitespacesAndNewlines)
    guard str.hasPrefix("-+") == false else { return 0 }
    guard str.isEmpty == false else { return 0 }
    let isNegative = str[str.startIndex] == "-"
    if isNegative {
      str = str[str.index(after: str.startIndex)..<str.endIndex].stringValue
    }
    guard str.isEmpty == false else { return 0 }
    if str[str.startIndex].isNumber == false && (str[str.startIndex] != "+") {
      return 0
    }

    if str.count > 1, str[str.startIndex] == "+", str[str.index(after: str.startIndex)].isNumber == false {
      return 0
    }
    str = str.trimmingCharacters(in: CharacterSet.decimalDigits.inverted)

    if let range =  str.range(of: ".") {
      str = str[str.startIndex..<range.lowerBound].stringValue
    }

    if let range = str.range(of: ".") {
      str = str[str.startIndex..<range.lowerBound].stringValue
    }

    if str.contains(where: { $0.isNumber == false }) {
      return 0
    }

    guard var result = Double(str) else { return 0 }
    result *= (isNegative ? -1 : 1)
    guard result <= Double(Int32.max) else { return Int(Int32.max) }
    guard result >= Double(Int32.min) else { return Int(Int32.min) }

    return Int(result)
  }

  class func test() {
    print(Atoi().myAtoi("  -0012a42")) // FAILS on this input
  }
}

extension Substring {
  var stringValue: String { return String(self) }
}
