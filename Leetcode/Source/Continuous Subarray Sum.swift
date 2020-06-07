//
//  Continuous Subarray Sum.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 5/28/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa
/*
 https://leetcode.com/explore/interview/card/facebook/55/dynamic-programming-3/3038/

 Given a list of non-negative numbers and a target integer k, write a function to check if the array has a continuous subarray of size at least 2 that sums up to a multiple of k, that is, sums up to n*k where n is also an integer.



 Example 1:

 Input: [23, 2, 4, 6, 7],  k=6
 Output: True
 Explanation: Because [2, 4] is a continuous subarray of size 2 and sums up to 6.
 Example 2:

 Input: [23, 2, 6, 4, 7],  k=6
 Output: True
 Explanation: Because [23, 2, 6, 4, 7] is an continuous subarray of size 5 and sums up to 42.


 Note:

 The length of the array won't exceed 10,000.
 You may assume the sum of all the numbers is in the range of a signed 32-bit integer.
 */
class Continuous_Subarray_Sum: NSObject {
  func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
      guard nums.count > 1 else { return false }

      var dp = Array(repeating: 0, count: nums.count)

      for (ind, num) in nums.enumerated() {
          if ind == 0 {
              dp[ind] = num
          } else {
              dp[ind] = dp[ind - 1] + num
          }
      }

      for start in 0..<nums.count - 1 {
          for end in start + 1..<nums.count {
              let sum = dp[end] - dp[start] + nums[start]
              if sum == k {
                  return true
              }

              if k != 0 {
                  let (q, r) = sum.quotientAndRemainder(dividingBy: k)
                  if r == 0 {
                      return true
                  }
              }
          }
      }
      return false
  }
}
