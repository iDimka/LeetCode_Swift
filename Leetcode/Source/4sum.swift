//
//  4sum.swift
//  Leetcode
//
//  Created by Dzmitry Sazanovich on 8/25/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

class Solution4Sum {
  func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    let value = kSum(nums.sorted(), target, 4, 0)

    return value
  }

  func kSum(_ nums: [Int], _ target: Int, _ k: Int, _ start: Int) -> [[Int]] {
    var result = [[Int]]()
    if (start == nums.count || nums[start] * k > target || target > nums[nums.count - 1] * k) {
      return result
    }
    if k == 2 {
      return twoSum(nums, target, start)
    } else {
      for index in start..<nums.count {
        guard (index == start || nums[index - 1] != nums[index]) else {
          continue
        }

        var value = kSum(nums, target - nums[index], k - 1, index + 1)
        value = value.map { val -> [Int] in
          var val = val
          val.append(nums[index])
          return val
        }
        print("\(k) \(value); \(nums[index])")
        result += value

      }
    }

    return result
  }

  func twoSum(_ nums: [Int], _ target: Int, _ start: Int) -> [[Int]] {
    var cache: Set<Int> = []
    var result: [[Int]] = []
    // print(nums[start...])
    for index in start..<nums.count {
      let lastNum = result.last?.first ?? Int.min
      guard lastNum != nums[index] || result.isEmpty else { print("d"); continue }

      let rest = target - nums[index]
      if cache.contains(rest) {
        result.append([nums[index], rest])
      }
      cache.insert(nums[index])
    }
    return result
  }


  class func test() {
    let input = [-1,0,-5,-2,-2,-4,0,1,-2]
    let solution = Solution4Sum()
    print(solution.fourSum(input, -9))
  }
}
