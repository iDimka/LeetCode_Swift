//
//  Product of Array Except Self.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 5/30/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa
/*
 https://leetcode.com/explore/interview/card/facebook/5/array-and-strings/3016/

 Given an array nums of n integers where n > 1,  return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].

 Example:

 Input:  [1,2,3,4]
 Output: [24,12,8,6]
 Constraint: It's guaranteed that the product of the elements of any prefix or suffix of the array (including the whole array) fits in a 32 bit integer.

 Note: Please solve it without division and in O(n).

 Follow up:
 Could you solve it with constant space complexity? (The output array does not count as extra space for the purpose of space complexity analysis.)
 */

class Product_of_Array_Except_Self: NSObject {
  func productExceptSelfExtraMemory(_ nums: [Int]) -> [Int] {
    guard nums.isEmpty == false else { return [] }

    var left = Array(repeating: 1, count: nums.count)
    for ind in 1..<nums.count {
      left[ind] = left[ind-1]*nums[ind-1]
    }
    // print(left)

    var right = Array(repeating: 1, count: nums.count)
    for ind in (0..<nums.count - 1).reversed() {
      // print("ind: \(ind), \(nums[ind]):\(right[ind])")
      right[ind] = nums[ind + 1] * right[ind+1]
    }
    //print(right)
    var answer = Array(repeating: 1, count: nums.count)
    for ind in 0..<nums.count {
      answer[ind] = left[ind]*right[ind]
    }

    return answer
  }

  func productExceptSelf(_ nums: [Int]) -> [Int] {
    var answer = Array(repeating:1, count: nums.count)

    for ind in 1..<nums.count {
      answer[ind] = answer[ind - 1] * nums[ind - 1]
    }
    for ind in (0..<nums.count - 1).reversed() {
      answer[ind] = answer[ind + 1] * nums[ind + 1]
    }

    return answer
  }
}
