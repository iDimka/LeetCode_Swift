//
//  Divide Two Integers.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 5/28/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa
/*
 https://leetcode.com/explore/interview/card/facebook/54/sorting-and-searching-3/308/

 Given two integers dividend and divisor, divide two integers without using multiplication, division and mod operator.

 Return the quotient after dividing dividend by divisor.

 The integer division should truncate toward zero, which means losing its fractional part. For example, truncate(8.345) = 8 and truncate(-2.7335) = -2.

 Example 1:

 Input: dividend = 10, divisor = 3
 Output: 3
 Explanation: 10/3 = truncate(3.33333..) = 3.
 Example 2:

 Input: dividend = 7, divisor = -3
 Output: -2
 Explanation: 7/-3 = truncate(-2.33333..) = -2.
 Note:

 Both dividend and divisor will be 32-bit signed integers.
 The divisor will never be 0.
 Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 231 − 1 when the division result overflows.
 */
class Divide_Two_Integers: NSObject {
  func divide(_ dividend: Int, _ divisor: Int) -> Int {
    if dividend == Int32.min && divisor == -1 { return Int(Int32.max) }

    var negatives = 2
    var quotient = 0
    var dividend = dividend
    var divisor = divisor

    if dividend > 0 {
      negatives -= 1
      dividend = -dividend
    }
    if divisor > 0 {
      negatives -= 1
      divisor = -divisor
    }

    while dividend <= divisor {
      var powerOfTwo = -1
      var value = divisor

      while value > Int.min / 2, value + value > dividend {
        powerOfTwo <<= 1
        value <<= 1
      }
      quotient += powerOfTwo
      dividend -= value
    }

    return negatives == 1 ? quotient : -quotient
  }
}
