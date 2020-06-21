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

 Combinatorics
 https://www.superprof.co.uk/resources/academic/maths/probability/combinatorics/permutations-with-repetition.html#chapter_example-1
 */
class Permutations: NSObject {
  func permute(_ nums: [Int]) -> [[Int]] {
    guard nums.count > 0 else { return [] }
    
    var result: [[Int]] = []
    var nums = nums.sorted()
    permute(&nums, start: 0, result: &result)
    
    return result
  }
  
  private func permute(_ nums: inout [Int], start: Int, result: inout [[Int]]) {
    for _ in 0..<start {
       print("  ", separator: "", terminator: "")
     }
    print("\(start..<nums.count) start for")
    
    guard start < nums.count else { result.append(nums); print("\(start) in \(start..<nums.count): + \(nums)"); return }

    for ind in start..<nums.count {
      if ind != start, nums[ind] == nums[start] {
        continue
      }

      nums.swapAt(start, ind)
      print("Swap \(start):\(ind) \(nums.map(String.init).joined(separator: ""))")
      permute(&nums, start: start + 1, result: &result )
      nums.swapAt(ind, start)
      print("Un-Swap \(start):\(ind) \(nums.map(String.init).joined(separator: ""))")
    }
    print("\(start..<nums.count) end for\n")
  }
  
  func permuteUnique(_ nums: [Int]) -> [[Int]] {
    
    var result: Set<[Int]> = []
    var nums = nums
    permuteUnique(&nums, start: 0, result: &result)
    
    return Array(result)
  }
  
  private func permuteUnique(_ nums: inout [Int], start: Int, result: inout Set<[Int]>) {
    // https://www.superprof.co.uk/resources/academic/maths/probability/combinatorics/permutations-with-repetition.html#chapter_example-1
    // PR(n,k) where n the number of numbers and k is the number of unique
    guard nums.count > start else { result.insert(nums); return }
    
    for index in start..<nums.count {
      nums.swapAt(index, start)
      permuteUnique(&nums, start: start + 1, result: &result)
      nums.swapAt(start, index)
    }
  }

  func anotherPermutation(_ nums: [Int], index: Int = 0) -> [[Int]] {
    guard nums.isEmpty == false else { return [[]] }

    var result: [[Int]] = []

    let firstNum = nums[0]
    let restNums = nums[1...].array

    print("before first: \(firstNum) rest: \(restNums)")
    let restResult = anotherPermutation(restNums)
    print("after first: \(firstNum) rest: \(restResult)")

    for array in restResult {
      for index in 0...array.count {
        let prefix = array.prefix(upTo: index)
        let suffix = array.suffix(from: index)

        result.append(prefix + [firstNum] + suffix)
      }
    }

    return result
  }
  
  class func test() {
    let input = [1, 1, 2]
    
    print(Permutations().anotherPermutation(input.sorted()).map { $0.map { String($0) }.joined(separator: "") })
  }
}
