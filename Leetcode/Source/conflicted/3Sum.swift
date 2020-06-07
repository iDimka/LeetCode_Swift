//
//  3Sum.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 5/11/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

/*
 https://leetcode.com/explore/interview/card/facebook/5/array-and-strings/283/

 Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

 Note:

 The solution set must not contain duplicate triplets.

 Example:

 Given array nums = [-1, 0, 1, 2, -1, -4],

 A solution set is:
 [
   [-1, 0, 1],
   [-1, -1, 2]
 ]
    Hide Hint #1
 So, we essentially need to find three numbers x, y, and z such that they add up to the given value. If we fix one of the numbers say x, we are left with the two-sum problem at hand!
    Hide Hint #2
 For the two-sum problem, if we fix one of the numbers, say
 x
 , we have to scan the entire array to find the next number
 y
 which is
 value - x
 where value is the input parameter. Can we change our array somehow so that this search becomes faster?
    Hide Hint #3
 The second train of thought for two-sum is, without changing the array, can we use additional space somehow? Like maybe a hash map to speed up the search?
 */
class _Sum: NSObject {
  class Solution {
      func threeSum(_ nums: [Int]) -> [[Int]] {
          guard nums.count > 2 else { return [] }

          var result = [[Int]]()
          let nums = nums.sorted()

          for ind1 in 0..<nums.count {
              guard ind1 == 0 || (ind1 > 0 && nums[ind1] != nums[ind1 - 1]) else { continue }

              var low = ind1 + 1
              var high = nums.count - 1

              while low < high {
                  let val = nums[ind1] + nums[low] + nums[high]
                  if val == 0 {
                      result.append([nums[ind1], nums[low], nums[high]])
                      while low < high, nums[low] == nums[low + 1] {
                          low += 1
                      }
                      while low < high, nums[high] == nums[high - 1] {
                          high -= 1
                      }
                      low += 1
                      high -= 1
                  } else if val < 0 {
                      low += 1
                  } else {
                      high -= 1
                  }
              }
          }

          return Array(result)
      }
  }
}
