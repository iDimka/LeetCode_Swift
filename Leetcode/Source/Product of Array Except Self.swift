//
//  Product of Array Except Self.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 5/14/20.
//  Copyright © 2020 idimka. All rights reserved.
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
  class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
      guard nums.count > 0 else { return [] }
      guard nums.count > 1 else { return [0] }
      
      var left = Array<Int>(repeating: 0, count: nums.count)
      var right = Array<Int>(repeating: 0, count: nums.count)
      var result = Array<Int>(repeating: 0, count: nums.count)
      
      left[0] = 1
      for ind in 1..<nums.count {
        left[ind] = left[ind-1] * nums[ind - 1]
      }
      
      right[nums.count - 1] = 1
      for ind in (0..<nums.count - 1).reversed() {
        right[ind] = right[ind + 1] * nums[ind + 1]
      }
      
      for ind in 0..<nums.count {
        result[ind] = left[ind] * right[ind]
      }
      
      return result
    }
    
    func productExceptSelf_spaceEfficient(_ nums: [Int]) -> [Int] {
      guard nums.count > 0 else { return [] }
      guard nums.count > 1 else { return [0] }
      
      var result = Array<Int>(repeating: 0, count: nums.count)
      
      result[0] = 1
      for ind in 1..<nums.count {
        result[ind] = result[ind-1] * nums[ind - 1]
      }
      
      var prev = 1
      for ind in (0...nums.count - 1).reversed() {
        result[ind] *= prev
        prev *= nums[ind]
      }
      
      return result
    }
  }
}
