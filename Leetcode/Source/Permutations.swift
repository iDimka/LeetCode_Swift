//
//  Permutations.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 5/9/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa
/*
 Given a collection of distinct integers, return all possible permutations. https://leetcode.com/explore/interview/card/facebook/53/recursion-3/292/
 
 Example:
 
 Input: [1,2,3]
 Output:
 [
 [1,2,3],
 [1,3,2],
 [2,1,3],
 [2,3,1],
 [3,1,2],
 [3,2,1]
 ]
 */
class Permutations: NSObject {
  func permute(_ nums: [Int]) -> [[Int]] {
    guard nums.count > 0 else { return [] }
    
    var result: [[Int]] = []
    var nums = nums
    permute(&nums, start: 0, result: &result)
    
    return result
  }
  
  private func permute(_ nums: inout [Int], start: Int, result: inout [[Int]]) {
    guard start < nums.count else { result.append(nums); return }
    
    for ind in start..<nums.count {
      nums.swapAt(start, ind)
      permute(&nums, start: start + 1, result: &result )
      nums.swapAt(ind, start)
    }
  }
  
  func permuteUnique(_ nums: [Int]) -> [[Int]] {
    
    var result: Set<[Int]> = []
    var nums = nums
    permuteUnique(&nums, start: 0, result: &result)
    
    return Array(result)
  }
  
  private func permuteUnique(_ nums: inout [Int], start: Int, result: inout Set<[Int]>) {
    guard nums.count > start else { result.insert(nums); return }
    
    for index in start..<nums.count {
      nums.swapAt(index, start)
      permuteUnique(&nums, start: start + 1, result: &result)
      nums.swapAt(start, index)
    }
  }
  
  class func test() {
    let input = [1, 2, 3]
    
    print(Permutations().permute(input).map { $0.map { String($0) }.joined(separator: "") })
  }
}
