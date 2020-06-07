//
//  Jump Game.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 6/6/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

class Jump_Game_55: NSObject {
  func canJumpGreedy(_ nums: [Int]) -> Bool {
    guard nums.count > 1 else { return true }

    var lastPos = nums.count - 1
    for index in (0..<nums.count).reversed() {
      if lastPos <= nums[index] + index {
        lastPos = index
      }
    }

    return lastPos == 0
  }

  enum Endeavor: Int {
    case good, bad, unknown
  }

  func canJump(_ nums: [Int]) -> Bool {
    var memo = Array(repeating: Endeavor.unknown, count: nums.count)
    memo[memo.count - 1] = .good

    return backtrack(nums, index: 0, memo: &memo)
  }

  func backtrack(_ nums: [Int], index: Int, memo: inout [Endeavor]) -> Bool {
    guard index < memo.count else { return true }
    guard memo[index] == .unknown else { return memo[index] == .good }

    let nextIndex = nums[index] + index

    guard nextIndex != index else { return false }

    for innerIndex in (index+1...nextIndex) {
      if backtrack(nums, index: innerIndex, memo: &memo) {
        memo[index] = .good
        return true
      }
    }

    memo[index] = .bad
    return false
  }

  func canJump_dp_bottom_up(_ nums: [Int]) -> Bool {
      guard nums.count > 1 else { return true }

      var memo = Array(repeating: Endeavor.unknown, count: nums.count)
      memo[memo.count - 1] = .good

      for startIndex in (0..<memo.count - 1).reversed() {
          let nextJump = min(nums.count - 1, nums[startIndex] + startIndex)

          print("\(startIndex):\(nextJump)")
           guard nextJump > startIndex else { continue }

          for endIndex in (startIndex + 1...nextJump) {
              print("\(endIndex): \(memo[endIndex])")
              if memo[endIndex] == .good {
                  memo[startIndex] = .good
                  break
              }
          }
      }
      print(memo)
      return memo[0] == .good
  }

  class func test() {
    let input = [3,2,1,0,4]
    print(Jump_Game_55().canJump_dp_bottom_up(input))
  }
}
