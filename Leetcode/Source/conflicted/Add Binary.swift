//
//  Add Binary.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 5/11/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

/*
 https://leetcode.com/explore/interview/card/facebook/5/array-and-strings/263/

 Given two binary strings, return their sum (also a binary string).

 The input strings are both non-empty and contains only characters 1 or 0.

 Example 1:

 Input: a = "11", b = "1"
 Output: "100"
 Example 2:

 Input: a = "1010", b = "1011"
 Output: "10101"


 Constraints:

 Each string consists only of '0' or '1' characters.
 1 <= a.length, b.length <= 10^4
 Each string is either "0" or doesn't contain any leading zero.
 */
class Add_Binary: NSObject {
  class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
      func rest(ind ind1: Int, str a: String, result: inout String, carry: inout Int) {
        var ind1 = ind1

        while ind1 >= 0, let ch = a.charAt(ind1), let val = Int(String(ch)) {
          let current = val + carry
          let (quotinent, reminder) = current.quotientAndRemainder(dividingBy: 2)

          result.append(String(reminder))

          carry = quotinent
          ind1 -= 1
        }
      }

      var result = ""
      var ind1 = a.count - 1
      var ind2 = b.count - 1
      var carry = 0

      while ind1 >= 0, ind2 >= 0, let val1 = a.charAt(ind1), let val2 = b.charAt(ind2) {
        print("chars \(val1) & \(val2)")
        guard let val1 = Int(String(val1)), let val2 = Int(String(val2)) else { return "777" }
        print("vals \(val1) & \(val2)")

        let current = val1 + val2 + carry
        let (quotinent, part) = current.quotientAndRemainder(dividingBy: 2)
        print("current \(current) quotinent \(quotinent) and reminder \(part)")
        result.append(String(part))
        carry = quotinent

        ind1 -= 1
        ind2 -= 1
      }



      rest(ind: ind1, str: a, result: &result, carry: &carry)
      rest(ind: ind2, str: b, result: &result, carry: &carry)
      if carry == 1 {
        result.append(String(carry))
      }

      return String(result.reversed())
    }
  }
}

extension String {
  func charAt(_ index: Int) -> Character? {
    guard index < count else { return nil }

    return self[self.index(self.startIndex, offsetBy: index)]
  }
}
