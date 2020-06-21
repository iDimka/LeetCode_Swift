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

 Combinatorics
 https://www.superprof.co.uk/resources/academic/maths/probability/combinatorics/permutations-with-repetition.html#chapter_example-1
 */

class Subsets: NSObject {
  var result = [[Int]]()
  
  func subsets(_ nums: [Int]) -> [[Int]] {
    var current: [Int] = []
    
    for ind in 0...nums.count {
      print("New thread with limit \(ind)")
      backtrack(start: 0, current: &current, nums: nums, limit: ind)
    }
    
    return result
  }
  
  private func backtrack(start: Int, current: inout [Int], nums: [Int], limit: Int) {
    for _ in 0..<start {
      print("  ", separator: "", terminator: "")
    }

    print("\(start..<nums.count) start loop with limit \(limit)")
    // if the combination is done
    guard current.count < limit else {
      result.append(current)
      print("Add start:\(start) limit:\(limit) in \(start..<nums.count): + \(result)");
      return
    }


    for ind in start..<nums.count {
      // add i into the current combination
      current.append(nums[ind])
      print("Append \(nums[ind]) by index \(ind) = '\(current.map(String.init).joined(separator: ""))'")
      // use next integers to complete the combination
      backtrack(start: ind + 1, current: &current, nums: nums, limit: limit)
      // backtrack
      let old = current.removeLast()
      print("Remove \(old) by index \(ind) = '\(current.map(String.init).joined(separator: ""))'")
    }
    print("\(start..<nums.count) end loop with limit \(limit) result: \(result)")
  }

  /**************************/

  func iteractiveSubsets(_ nums: [Int]) -> [[Int]] {
    var output: [[Int]] = [[]]

    for num in nums {
      var newSubsets: [[Int]] = []

      for resultElement in output {
        newSubsets.append(resultElement + [num])
      }

      output.append(contentsOf: newSubsets)
    }

    return output
  }

  func binarySubsets(_ nums: [Int]) -> [[Int]] {
    var result: [[Int]] = []

    for index in pow(2, nums.count).intValue..<pow(2, nums.count + 1).intValue {
      let substring = String(index, radix: 2)
      let bitmask = substring.suffix(from: substring.startIndex)

      print(bitmask)

      var set = [Int]()
      for index in nums.indices {
        if bitmask[bitmask.index(bitmask.startIndex, offsetBy: index)] == "1" {
            set += [nums[index]]
        }
      }
      result += [set]
    }

    return result
  }
  
  class func test() {
    print(Subsets().binarySubsets([1, 2, 3]))
  }
}

extension Decimal {
  var intValue: Int { NSDecimalNumber(decimal: self).intValue }
}
