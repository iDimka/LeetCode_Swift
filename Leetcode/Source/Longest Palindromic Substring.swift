//
//  Longest Palindromic Substring.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 5/23/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa
/**
 https://leetcode.com/explore/interview/card/facebook/55/dynamic-programming-3/3034/
 
 Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
 
 Example 1:
 
 Input: "babad"
 Output: "bab"
 Note: "aba" is also a valid answer.
 Example 2:
 
 Input: "cbbd"
 Output: "bb"
 Hide Hint #1
 How can we reuse a previously computed palindrome to compute a larger palindrome?
 Hide Hint #2
 If “aba” is a palindrome, is “xabax” and palindrome? Similarly is “xabay” a palindrome?
 Hide Hint #3
 Complexity based hint:
 If we use brute-force and check whether for every start and end position a substring is a palindrome we have O(n^2) start - end pairs and O(n) palindromic checks. Can we reduce the time for palindromic checks to O(1) by reusing some previous computation.
 */
class Longest_Palindromic_Substring: NSObject {
  func longestPalindrome(_ string: String) -> String {
    guard string.count > 1 else { return string }
    
    let array = string.map { String($0) }
    
    var dp = Array(repeating: Array(repeating: false, count: array.count), count: array.count)
    var max = Int.min
    
    for ind in 0..<array.count {
      dp[ind][ind] = true
    }
    
    dp.printMatrix()
    
    var startSubstring = 0
    var endSubstring = 0
    
    for ind in 0..<array.count - 1 {
      let startString = array[array.index(array.startIndex, offsetBy: ind)]
      let endString = array[array.index(array.startIndex, offsetBy: ind + 1)]
      
      dp[ind][ind + 1] = startString == endString
      if startString == endString, 2 > max {
        max = Swift.max(max, 2)
        startSubstring = ind
        endSubstring = ind + 1
      }
    }
    
    guard array.count > 2 else {
      return endSubstring - startSubstring > 0 ? String(string[string.index(string.startIndex, offsetBy: startSubstring)...string.index(string.startIndex, offsetBy: endSubstring)]) : string[string.startIndex].string
    }
    
    dp.printMatrix()
    for index in 3...array.count {
      for start in 0..<array.count - index + 1 {
        let end = start + index - 1
        let startString = array[start]
        let endString = array[end]
        
        if startString == endString, dp[start + 1][end - 1] {
          dp[start][end] = true
          if end - start + 1 > max {
            max = end - start + 1
            startSubstring = start
            endSubstring = end
          }
        }
        print("\(start)-\(end) "+startString+endString)
        dp.printMatrix()
      }
    }
    
    print(dp[0][array.count - 1])
    
    return endSubstring - startSubstring > 0 ? String(string[string.index(string.startIndex, offsetBy: startSubstring)...string.index(string.startIndex, offsetBy: endSubstring)]) : string[string.startIndex].string
  }
  
  class func test() {
    let solution = Longest_Palindromic_Substring()
    print(solution.longestPalindrome("bb"))
  }
}

extension Array {
  func printMatrix() {
    for arr in self {
      guard let arr = arr as? [Bool] else { return }
      
      print(arr.map { Int($0 ? 1 : 0) }, separator: "", terminator: "\n")
    }
  }
}
