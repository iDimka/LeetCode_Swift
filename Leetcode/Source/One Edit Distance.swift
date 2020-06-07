//
//  One Edit Distance.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 6/5/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

/*
 https://leetcode.com/explore/interview/card/facebook/5/array-and-strings/3015/

 Given two strings s and t, determine if they are both one edit distance apart.

 Note:

 There are 3 possiblities to satisify one edit distance apart:

 Insert a character into s to get t
 Delete a character from s to get t
 Replace a character of s to get t
 Example 1:

 Input: s = "ab", t = "acb"
 Output: true
 Explanation: We can insert 'c' into s to get t.
 Example 2:

 Input: s = "cab", t = "ad"
 Output: false
 Explanation: We cannot get t from s by only one step.
 Example 3:

 Input: s = "1203", t = "1213"
 Output: true
 Explanation: We can replace '0' with '1' to get t.

 */

class One_Edit_Distance: NSObject {
  func isOneEditDistance(_ s: String, _ t: String) -> Bool {
    guard abs(s.count - t.count) < 2 else { return false }
    guard s.count > 0 || t.count > 0 else { return false }
    let (baseString, secondString) = s.count > t.count ? (s, t) : (t, s)
    guard secondString.count > 0 else { return baseString.count == 1}

    for ind in 0..<secondString.count {
      let baseInd = baseString.index(baseString.startIndex, offsetBy: ind)
      let secondInd = secondString.index(secondString.startIndex, offsetBy: ind)
      let baseChar = baseString[baseInd]
      let secondChar = secondString[secondInd]

      if baseChar != secondChar {
        if baseString.count == secondString.count {
          return baseString[baseString.index(after: baseInd)..<baseString.endIndex] ==
            secondString[secondString.index(after: secondInd)..<secondString.endIndex]
        } else {
          return baseString[baseString.index(after: baseInd)..<baseString.endIndex] ==
            secondString[secondInd..<secondString.endIndex]
        }
      }
    }

    return baseString.count == (secondString.count + 1)
  }
}
