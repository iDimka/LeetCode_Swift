//
//  Add Binary.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 5/24/20.
//  Copyright © 2020 idimka. All rights reserved.
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
  func addBinary(_ a: String, _ b: String) -> String {
      var carry = 0
      var index = 0
      var result = String(repeating: "0", count: max(a.count, b.count) + 1)
      
      while index < a.count, index < b.count {
          let aChar = a[a.index(a.startIndex, offsetBy: a.count - 1 - index)]
          let bChar = b[b.index(b.startIndex, offsetBy: b.count - 1 - index)]
      
          let sum = (Int(String(aChar)) ?? 0) + (Int(String(bChar)) ?? 0) + carry
          let (quotient, reminder) = sum.quotientAndRemainder(dividingBy: 2)
          let resultIndex = result.index(result.startIndex, offsetBy: result.count - 1 - index)
          result.replaceSubrange(resultIndex...resultIndex, with: "\(reminder)")
          carry = quotient
          
          index += 1;// print("resutl: \(result), carry: \(carry) sum: \(sum)")
      }
      
      while index < a.count {
          let aChar = a[a.index(a.startIndex, offsetBy: a.count - 1 - index)]
          
          let sum = (Int(String(aChar)) ?? 0) + carry
          let (quotient, reminder) = sum.quotientAndRemainder(dividingBy: 2)
          
          let resultIndex = result.index(result.startIndex, offsetBy: result.count - index - 1)
          result.replaceSubrange(resultIndex...resultIndex, with: "\(reminder)")
          
          carry = quotient
          index += 1
      }
      
       while index < b.count {
          let bChar = b[b.index(b.startIndex, offsetBy: b.count - 1 - index)]
          
          let sum = (Int(String(bChar)) ?? 0) + carry
          let (quotient, reminder) = sum.quotientAndRemainder(dividingBy: 2)
          
          let resultIndex = result.index(result.startIndex, offsetBy: result.count - index - 1)
          result.replaceSubrange(resultIndex...resultIndex, with: "\(reminder)")
           
          carry = quotient
          index += 1
      }
      
      if carry == 1 {
          index += 1
          result.replaceSubrange(result.startIndex...result.startIndex, with: "\(carry)")
      }
          
      if result.count > index {
          result = String(result.suffix(index))
      }
      
      return result
  }
}
