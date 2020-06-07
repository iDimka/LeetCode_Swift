//
//  Roman to Integer.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 5/14/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa
/*
 https://leetcode.com/explore/interview/card/facebook/5/array-and-strings/3010/
 
 Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

 Symbol       Value
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 For example, two is written as II in Roman numeral, just two one's added together. Twelve is written as, XII, which is simply X + II. The number twenty seven is written as XXVII, which is XX + V + II.

 Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

 I can be placed before V (5) and X (10) to make 4 and 9.
 X can be placed before L (50) and C (100) to make 40 and 90.
 C can be placed before D (500) and M (1000) to make 400 and 900.
 Given a roman numeral, convert it to an integer. Input is guaranteed to be within the range from 1 to 3999.

 Example 1:

 Input: "III"
 Output: 3
 Example 2:

 Input: "IV"
 Output: 4
 Example 3:

 Input: "IX"
 Output: 9
 Example 4:

 Input: "LVIII"
 Output: 58
 Explanation: L = 50, V= 5, III = 3.
 Example 5:

 Input: "MCMXCIV"
 Output: 1994
 Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
    Hide Hint #1
 I - 1
 V - 5
 X - 10
 L - 50
 C - 100
 D - 500
 M - 1000
    Hide Hint #2
 Rules:
 * If I comes before V or X, subtract 1 eg: IV = 4 and IX = 9
 * If X comes before L or C, subtract 10 eg: XL = 40 and XC = 90
 * If C comes before D or M, subtract 100 eg: CD = 400 and CM = 900
 */
class Roman_to_Integer: NSObject {
  class Solution {
      let mapping = [
  "I":             1,
  "V":             5,
  "X":             10,
  "L":             50,
  "C":             100,
  "D":             500,
  "M":             1000,
      ]
      
      func romanToInt(_ s: String) -> Int {
          var index = 0
          var sum = 0
          
          while index < s.count {
              let currentString = s[s.index(s.startIndex, offsetBy: index)].stringValue
              guard let current = mapping[currentString] else { continue }
              
              if index < s.count - 1 {
                  let nextString = s[s.index(s.startIndex, offsetBy: index + 1)].stringValue
                  guard let next = mapping[nextString] else { continue }
                  
                  if next > current {
                      sum -= current
                      sum += next
                      index += 2
                  } else {
                      sum += current
                      index += 1
                  }
              } else {
                  sum += current
                  index += 1
              }
          }
          
          return sum
      }
  }
}

//extension Substring {
//     var stringValue: String { return String(self) }
// }
