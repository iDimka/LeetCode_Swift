//
//  Minimum Window Substring.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 5/29/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

/*
 https://leetcode.com/explore/interview/card/facebook/5/array-and-strings/285/
 
 Given a string S and a string T, find the minimum window in S which will contain all the characters in T in complexity O(n).
 
 Example:
 
 Input: S = "ADOBECODEBANC", T = "ABC"
 Output: "BANC"
 Note:
 
 If there is no such window in S that covers all characters in T, return the empty string "".
 If there is such window, you are guaranteed that there will always be only one unique minimum window in S.
 Hide Hint #1
 Use two pointers to create a window of letters in S, which would have all the characters from T.
 Hide Hint #2
 Since you have to find the minimum window in S which has all the characters from T, you need to expand and contract the window using the two pointers and keep checking the window for all the characters. This approach is also called Sliding Window Approach.
 
 L ------------------------ R , Suppose this is the window that contains all characters of T
 
 L----------------- R , this is the contracted window. We found a smaller window that still contains all the characters in T
 
 When the window is no longer valid, start expanding again using the right pointer.
 */

class Minimum_Window_Substring: NSObject {
  func minWindow(_ s: String, _ t: String) -> String {
    guard s.count >= t.count else { return "" }
    guard s.count > 0 else { return s }
    guard s != t else { return s }
    
    var result:(length: Int, left: String.Index, right: String.Index)
      = (length: -1, left: s.startIndex, right: s.startIndex)
    var requiredDict: [Character: Int] = [:]; t.forEach { requiredDict[$0, default: 0] += 1 }
    let requiredSize = requiredDict.count
    var foundDict = [Character:Int]()
    var foundSize = 0
    
    var left = s.startIndex
    var right = s.startIndex
    
    while right < s.endIndex {
      let rightChar = s[right]
      foundDict[rightChar, default: 0] += 1
      
      if let count = requiredDict[rightChar], foundDict[rightChar, default: 0] == count {
        foundSize += 1
        
        if foundSize == requiredSize {
          while left < right {
            let leftChar = s[left]
            left = s.index(after: left)
            
            foundDict[leftChar, default: 0] -= 1
            if let count = requiredDict[leftChar], foundDict[leftChar, default: 0] != count {
              break
            }
          }
          
          if result.length > s.distance(from: left, to: right) {
            result = (s.distance(from: left, to: right), left, right)
          }
        }
      }
      right = s.index(after: right)
    }
    
    return result.length == 0 ? "" : String(s[result.left...result.right])
  }
  
  class func test() {
    print(Minimum_Window_Substring().minWindow("axbycz","abc"))
  }
}
