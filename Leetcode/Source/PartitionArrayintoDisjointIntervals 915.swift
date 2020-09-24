//
//  915.swift
//  Leetcode
//
//  Created by Dzmitry Sazanovich on 9/17/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

class PartitionArrayintoDisjointIntervals: NSObject {
  func partitionDisjoint(_ A: [Int]) -> Int {
    guard A.isEmpty == false else { return -1 }

    var minRight: [Int] = Array(repeating: 0, count: A.count)
    var maxLeft: [Int] = Array(repeating: 0, count: A.count)

    var maxValue = A[0]
    for (ind, num) in A.enumerated() {
      maxValue = max(maxValue, num)
      maxLeft[ind] = maxValue
    }
    
    var minValue = A[A.count - 1]
    for (ind, num) in A.enumerated().reversed() {
      minValue = min(minValue, num)
      minRight[ind] = minValue
    }

    for ind in 1..<A.endIndex {
      if  maxLeft[ind - 1] <= minRight[ind] {
        return ind
      }
    }

    return -2
  }

  class func test() {
    let input = [1,1,1,0,6,12]
    let solution = PartitionArrayintoDisjointIntervals()
    print(solution.partitionDisjoint(input))
  }
}

