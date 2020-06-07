//
//  Search in Rotated Sorted Array.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 4/19/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

class Search_in_Rotated_Sorted_Array: NSObject {
  func search(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count > 1 else {
      guard let first = nums.first, first == target else { return -1 }

      return 0
    }

    if nums[0] < nums[nums.count - 1] {
      return binSearch(nums, target: target, left: 0, right: nums.count - 1) ?? -1
    }

    let pivot = findPivot(nums, left: 0, right: nums.count - 1) ?? -1

    return binSearch(nums, target: target, left: 0, right: pivot - 1)
      ?? binSearch(nums, target: target, left: pivot, right: nums.count - 1)
      ?? -1
  }

  func findPivot(_ nums: [Int], left: Int, right: Int) -> Int? {
    guard right >= left else { return nil }

    let pivot = left + (right - left) / 2

    print("l:\(left),r:\(right),p:\(pivot)")

    if nums[pivot] > nums[pivot + 1] {
      return pivot + 1
    }

    if nums[left] <= nums[pivot] {
      return findPivot(nums, left: pivot + 1, right: right)
    } else {
      return findPivot(nums, left: left, right: pivot - 1)
    }
  }

  func binSearch(_ nums: [Int], target: Int, left: Int, right: Int) -> Int? {
    guard right >= left else { return nil }

    let pivot = (left + right) / 2
    if nums[pivot] == target {
      return pivot
    } else if nums[pivot] > target {
      return binSearch(nums, target: target, left: left, right: pivot - 1)
    } else {
      return binSearch(nums, target: target, left: pivot + 1, right: right)
    }
  }

  class func test() {
    let solution = Search_in_Rotated_Sorted_Array()
    let input = [5,7,0,1,2]
    print(solution.search(input, 2))
  }
}
