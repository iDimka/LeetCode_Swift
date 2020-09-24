//
//  Majority Element II.swift
//  Leetcode
//
//  Created by Dzmitry Sazanovich on 9/7/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

class Majority_Element: NSObject {
  func isMajorityElement(_ nums: [Int], _ target: Int) -> Bool {
    return nums.map { $0 == target ? 1 : 0 }
      .reduce(0, +) > nums.count / 2
  }

  func isMajorityElement2(_ nums: [Int], _ target: Int) -> Bool {
      var count = 0
      for num in nums where num == target {
          count += 1
      }
      return count > (nums.count / 2)
  }

  func majorityElement(_ nums: [Int]) -> Int {
    guard nums.isEmpty == false else { return -1 }

    var candidate = nums[0]
    var count = 1

    for ind in 1..<nums.count {
      let num = nums[ind]
      // print(num)
      if candidate == num {
        count += 1
      } else {
        count -= 1
        if count == 0 {
          candidate = num
          count = 1
        }
      }
    }

    return candidate
  }

  func majority2Element(_ nums: [Int]) -> [Int] {
    var candidate1: Int?
    var candidate2: Int?

    var count1 = 0
    var count2 = 0

    for num in nums {
      if let cand = candidate1, cand == num {
        count1 += 1
      } else if let cand = candidate2, cand == num {
        count2 += 1
      } else if count1 == 0 {
        candidate1 = num
        count1 += 1
      } else if count2 == 0 {
        candidate2 = num
        count2 += 1
      } else {
        count1 -= 1
        count2 -= 1
      }
    }

    count1 = 0
    count2 = 0

    for num in nums {
      if let cand = candidate1, cand == num {
        count1 += 1
      } else if let cand = candidate2, cand == num {
        count2 += 1
      }
    }

    var result: [Int] = []

    if let cand = candidate1, count1 > nums.count / 3 {
      result.append(cand)
    }
    if let cand = candidate2, count2 > nums.count / 3 {
      result.append(cand)
    }


    return result
  }

  func majorityElementNmemory(_ nums: [Int]) -> [Int] {
    var dict: [Int: Int] = [:]

    nums.forEach { dict[$0, default: 0] += 1 }

    return dict.filter { keyValue in return keyValue.1 > nums.count / 3 }.map { $0.0 }
  }
}
