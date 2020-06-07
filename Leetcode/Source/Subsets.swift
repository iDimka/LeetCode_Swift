//
//  Subsets.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 5/26/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa
/*
 https://leetcode.com/explore/interview/card/facebook/53/recursion-3/278/
 
 Given a set of distinct integers, nums, return all possible subsets (the power set).
 
 Note: The solution set must not contain duplicate subsets.
 
 Example:
 
 Input: nums = [1,2,3]
 Output:
 [
 [3],
 [1],
 [2],
 [1,2,3],
 [1,3],
 [2,3],
 [1,2],
 []
 ]
 */

class Subsets: NSObject {
  var result = [[Int]]()
  
  func subsets(_ nums: [Int]) -> [[Int]] {
    var current: [Int] = []
    
    for ind in 0...nums.count {
      backtrack(first: 0, current: &current, nums: nums, limit: ind)
    }
    
    return result
  }
  
  private func backtrack(first: Int, current: inout [Int], nums: [Int], limit: Int) {
    // if the combination is done
    print("\(first): \(current.count)")
    guard current.count != limit else { return result.append(current) }
    
    for ind in first..<nums.count {
      // add i into the current combination
      current.append(nums[ind])
      // use next integers to complete the combination
      backtrack(first: ind + 1, current: &current, nums: nums, limit: limit)
      // backtrack
      current.removeLast()
    }
  }
  
  class func test() {
    print(Subsets().subsets([1, 2, 3]))
  }
}
