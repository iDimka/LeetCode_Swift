//
//  Longest Valid Parentheses.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 5/19/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa
/**
 https://leetcode.com/explore/interview/card/facebook/55/dynamic-programming-3/3035/

 Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.

 Example 1:

 Input: "(()"
 Output: 2
 Explanation: The longest valid parentheses substring is "()"
 Example 2:

 Input: ")()())"
 Output: 4
 Explanation: The longest valid parentheses substring is "()()"
 */
class Longest_Valid_Parentheses: NSObject {
  func longestValidParenthesesWithDP(_ s: String) -> Int {
    guard s.count > 1 else { return 0 }

    var maxLength = 0
    var dp = Array(repeating: 0, count: s.count)

    for index in 1..<s.count {
      let curChar = s[s.index(s.startIndex, offsetBy: index)]
      let prevChar = s[s.index(s.startIndex, offsetBy: index - 1)]

      guard curChar == ")" else { continue }

      if prevChar == "(" {
        dp[index] = (index >= 2 ? dp[index - 2] : 0) + 2
      } else if index - dp[index - 1] > 0 && s[s.index(s.startIndex, offsetBy: index - dp[index - 1] - 1)] == "(" {
        dp[index] = dp[index - 1] + ((index - dp[index - 1]) >= 2 ? dp[index - dp[index - 1] - 2] : 0) + 2;
      }
      maxLength = max(maxLength, dp[index])
    }

    return maxLength
  }

  func longestValidParentheses(_ s: String) -> Int {
    var left = 0
    var right = 0
    var maxCount = 0

    for char in s {
      if char == "(" {
        left += 1
      } else {
        right += 1
      }

      if left == right {
        maxCount = max(maxCount, left + right)//; print("max: \(maxCount), \(left):\(right)")
      } else if right > left {
        left = 0; right = 0
      }
    }
    print("---")
    left = 0; right = 0

    for char in s.reversed() {//print(char)
      if char == "(" {
        left += 1//; print("left \(left):\(right)")
      } else {
        right += 1//; print("right \(left):\(right)")
      }

      if left == right {
        maxCount = max(maxCount, left + right)//; print("rev max: \(maxCount), \(left):\(right)")
      } else if left > right{
        left = 0; right = 0
      }
    }

    // print("max: \(maxCount), \(left):\(right)")

    // let tmp = left > right ? right * 2 : left * 2

    return maxCount
  }

  class func test() {
    let solution = Longest_Valid_Parentheses()
    let input = "(()))"
    print(solution.longestValidParenthesesWithDP(input))
  }
}
