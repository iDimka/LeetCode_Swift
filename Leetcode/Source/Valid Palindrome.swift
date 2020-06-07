//
//  Valid Palindrome.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 5/30/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa
/*
 https://leetcode.com/explore/interview/card/facebook/5/array-and-strings/288/

 Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

 Note: For the purpose of this problem, we define empty string as valid palindrome.

 Example 1:

 Input: "A man, a plan, a canal: Panama"
 Output: true
 Example 2:

 Input: "race a car"
 Output: false
 */
class Valid_Palindrome: NSObject {
  func isPalindrome(_ s: String) -> Bool {
      let input = s.filter { $0.isLetter || $0.isNumber }.map { $0.lowercased() }
      var left = 0
      var right = input.count - 1

      while left <= right {
          guard input[left] == input[right] else { print("\(left):\(right)")
              return false
          }
          left += 1
          right -= 1
      }

      return true
  }
}
