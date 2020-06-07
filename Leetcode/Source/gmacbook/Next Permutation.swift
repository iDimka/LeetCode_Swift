//
//  Next Permutation.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 5/29/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

/*
 https://leetcode.com/explore/interview/card/facebook/5/array-and-strings/3012/

 Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.

 If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).

 The replacement must be in-place and use only constant extra memory.

 Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.

 1,2,3 → 1,3,2
 3,2,1 → 1,2,3
 1,1,5 → 1,5,1
 */

class Next_Permutation: NSObject {
  func nextPermutation(_ nums: inout [Int]) {
         guard nums.count > 1 else { return }

         var start = nums.count - 2
         while start >= 0, nums[start] >= nums[start + 1] {
             start -= 1
         }

         if start >= 0 {
             var end = nums.count - 1
             while end >= 0, nums[end] <= nums[start] {
                 end -= 1
             }

             nums.swapAt(start, end)
         }

         reverse(&nums, start: start + 1, end: nums.count - 1)
     }

     func reverse(_ nums: inout [Int], start: Int, end: Int) {
         var start = start
         var end = end

         while start < end {
             nums.swapAt(start, end)
             start += 1
             end -= 1
         }
     }
}
