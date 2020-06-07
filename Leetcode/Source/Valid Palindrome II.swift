//
//  Valid Palindrome II.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 5/30/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

class Valid_Palindrome_II: NSObject {
  func validPalindromeLong(_ s: String) -> Bool {
    func isPalindrome(_ s: String) -> Bool {
      guard s.count > 1 else { return true }
      var start = 0
      var end = s.count - 1
      // print("range \(start):\(end)")
      while start < end {
        if s[s.index(s.startIndex, offsetBy: start)] != s[s.index(s.startIndex, offsetBy: end)] {
          return false
        }
        start += 1
        end -= 1
      }

      return true
    }

    guard isPalindrome(s) == false else { return true }

    for center in 0..<s.count {// print("index with center: \(center)")
      let index = s.index(s.startIndex, offsetBy: center)
      let candidate = String(s[s.startIndex..<index] + s[s.index(after: index)..<s.endIndex])
      // print(candidate)

      if isPalindrome(candidate) {
        return true
      }

    }

    return false
  }

  func validPalindromeTLE(_ s: String) -> Bool {
    func validPalindrome(_ s: String, start: Int, end: Int) -> Bool {
      for ind in start...start + (end - start) / 2 {
        guard s.charAt(ind) == s.charAt(end - ind + start) else { return false }
      }

      return true
    }
    for ind in 0..<s.count / 2 {
      guard s.charAt(ind) == s.charAt(s.count - ind - 1) else {
        return validPalindrome(s, start: ind + 1, end: s.count - ind - 1)
          || validPalindrome(s, start: ind, end: s.count - 2 - ind)
      }
    }

    return true
  }

  func validPalindrome(_ s: String) -> Bool {
    func isValidPalindrome(_ s: Substring) -> Bool {
      var start = s.startIndex
      var end = s.index(before: s.endIndex)

      while start < end {
        guard s[start] == s[end] else { return false }

        start = s.index(after: start)
        end = s.index(before: end)
      }

      return true
    }

    var start = s.startIndex
    var end = s.index(before: s.endIndex)

    while start < end {
      guard s[start] == s[end] else {
        let left = s[s.index(after: start)...end]
        let right = s[start...s.index(before: end)]
        return isValidPalindrome(left) || isValidPalindrome(right)
      }

      start = s.index(after: start)
      end = s.index(before: end)
    }

    return true
  }

  class func test() {
    print(Valid_Palindrome_II().validPalindrome("abc"))
  }
}
