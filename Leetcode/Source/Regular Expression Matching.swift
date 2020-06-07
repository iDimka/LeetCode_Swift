//
//  Regular Expression Matching.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 5/10/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa
/*
 https://leetcode.com/explore/interview/card/facebook/53/recursion-3/307/
 Given an input string (s) and a pattern (p), implement regular expression matching with support for '.' and '*'.
 
 '.' Matches any single character.
 '*' Matches zero or more of the preceding element.
 The matching should cover the entire input string (not partial).
 
 Note:
 
 s could be empty and contains only lowercase letters a-z.
 p could be empty and contains only lowercase letters a-z, and characters like . or *.
 Example 1:
 
 Input:
 s = "aa"
 p = "a"
 Output: false
 Explanation: "a" does not match the entire string "aa".
 Example 2:
 
 Input:
 s = "aa"
 p = "a*"
 Output: true
 Explanation: '*' means zero or more of the preceding element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".
 Example 3:
 
 Input:
 s = "ab"
 p = ".*"
 Output: true
 Explanation: ".*" means "zero or more (*) of any character (.)".
 Example 4:
 
 Input:
 s = "aab"
 p = "c*a*b"
 Output: true
 Explanation: c can be repeated 0 times, a can be repeated 1 time. Therefore, it matches "aab".
 Example 5:
 
 Input:
 s = "mississippi"
 p = "mis*is*p*."
 Output: false
 
 class Solution {
     public boolean isMatch(String text, String pattern) {
         if (pattern.isEmpty()) {
             return text.isEmpty();
         }

         boolean first_match = (!text.isEmpty() && (pattern.charAt(0) == text.charAt(0) || pattern.charAt(0) == '.'));

         if (pattern.length() > 1 && pattern.charAt(1) == '*'){
             return (isMatch(text, pattern.substring(2)) || (first_match && isMatch(text.substring(1), pattern)));
         } else {
             return first_match && isMatch(text.substring(1), pattern.substring(1));
         }
     }
 }
 
 */

class Regular_Expression_Matching: NSObject {
  func isMatch(_ s: String, _ p: String) -> Bool { // Not finished 36 / 447 test cases passed.
    guard s.isEmpty == false else { return p.isEmpty }
    
    return isMatch(s, p, at: 0, and: 0)
  }
  
  private func isMatch(_ s: String, _ p: String, at sPosition: Int, and pPosition: Int) -> Bool {
    guard pPosition < p.count else {
      print("\(sPosition)"); return sPosition >= s.count
    }
    
    guard let sSymbol = s.charStringAt(sPosition), let pSymbol = p.charStringAt(pPosition) else { return false }
    
    let isMatchAt = s.isEmpty == false && (sSymbol == pSymbol || pSymbol == ".")
                                                          
    if sSymbol.isEmpty || pSymbol.isEmpty {
        return false
    }
    print("\(sSymbol) & \(pSymbol) = \(isMatchAt)")
    
    if p.count > pPosition + 1, p.charStringAt(pPosition + 1) == "*" {
      return
        isMatch(s, p, at: sPosition, and: pPosition + 2)
          ||
          (isMatchAt && isMatch(s, p, at: sPosition + 1, and: pPosition))
    } else {
      return isMatchAt && isMatch(s, p, at: sPosition + 1, and: pPosition + 1)
    }
  }
  
  class func test() {
    let s = "aa"
    let p = "a*"
    
    print(Regular_Expression_Matching().isMatch(s, p))
  }
}

extension String {
  func charStringAt(_ position: Int) -> String? {
    guard position < count else { return nil }

    return self[index(startIndex, offsetBy: position)].stringValue
  }
}
//
//extension Character {
//  var stringValue: String { String(self) }
//}

extension Substring {
  var string: String { String(self) }
}
