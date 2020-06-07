//
//  Arithmetic Slices 413.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 5/26/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa
/*
 https://leetcode.com/problems/arithmetic-slices/
 
 A sequence of number is called arithmetic if it consists of at least three elements and if the difference between any two consecutive elements is the same.
 
 For example, these are arithmetic sequence:
 
 1, 3, 5, 7, 9
 7, 7, 7, 7
 3, -1, -5, -9
 The following sequence is not arithmetic.
 
 1, 1, 2, 5, 7
 
 A zero-indexed array A consisting of N numbers is given. A slice of that array is any pair of integers (P, Q) such that 0 <= P < Q < N.
 
 A slice (P, Q) of array A is called arithmetic if the sequence:
 A[P], A[p + 1], ..., A[Q - 1], A[Q] is arithmetic. In particular, this means that P + 1 < Q.
 
 The function should return the number of arithmetic slices in the array A.
 
 
 Example:
 
 A = [1, 2, 3, 4]
 
 return: 3, for 3 arithmetic slices in A: [1, 2, 3], [2, 3, 4] and [1, 2, 3, 4] itself.
 */

class Arithmetic_Slices_413: NSObject {
  var result = 0
  
  func numberOfArithmeticSlices(_ A: [Int]) -> Int {
    
    var dp = Array(repeating: -1, count: A.count)
    
    let _ = numberOf(A, ind: A.count - 1, dp: &dp)
    
    return result
  }
  
  func numberOf(_ nums: [Int], ind: Int, dp:inout [Int]) -> Int { print(ind)
    guard ind > 1 else { return 0 }
    guard dp[ind] == -1 else { return dp[ind] }
    
    var ap = 0
    
    if nums[ind - 1] - nums[ind - 2] == nums[ind] - nums[ind - 1] {
      ap = 1 + numberOf(nums, ind: ind - 1, dp: &dp)
      result += ap
    } else {
      let _ = numberOf(nums, ind: ind - 1, dp: &dp)
    }
    
    dp[ind] = ap
    
    print("\(nums[ind - 1] - nums[ind - 2])==\(nums[ind] - nums[ind - 1])")
    
    return ap
  }
  
  func numberOfArithmeticSlicesDPIteractive(_ A: [Int]) -> Int {
    var dp = Array(repeating: 0, count: A.count)
    var sum = 0
    
    for ind in 2..<A.count {
      let first = A[ind - 2]
      let second = A[ind - 1]
      let third = A[ind]
      
      if second - third == first - second {
        dp[ind] = dp[ind - 1] + 1
        sum += dp[ind]
      }
    }
    
    return sum
  }
  func numberOfArithmeticSlicesDPIteractiveZeroSpace(_ A: [Int]) -> Int {
      guard A.count > 2 else { return 0 }
      
      var dp = 0
      var sum = 0
      
      for ind in 2..<A.count {
          let first = A[ind - 2]
          let second = A[ind - 1]
          let third = A[ind]
          
          if second - third == first - second {
              dp += 1
              sum += dp
          } else {
              dp = 0
          }
      }
      
      return sum
  }
}
