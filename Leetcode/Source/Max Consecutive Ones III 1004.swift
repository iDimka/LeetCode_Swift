//
//  Max Consecutive Ones III 1004.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 5/31/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

class Max_Consecutive_Ones_III_1004: NSObject {
  func longestOnes_N(_ A: [Int], _ K: Int) -> Int {
    var head = 0
    var tail = 0
    var zeros = 0

    for num in A {
      if num == 0 {
        zeros += 1
      }

      if zeros > K {
        if A[tail] == 0 {
          zeros -= 1
        }
        tail += 1
      }

      head += 1
    }

    return head - tail
  }

  func longestOnes_Npow2(_ A: [Int], _ K: Int) -> Int {
    var head = 0
    var zeros = 0
    var result = Int.min

    for (tail, num) in A.enumerated() {
      if num == 0 {
        zeros += 1
      }

      while zeros > K, head < A.count {
        if A[head] == 0 {
          zeros -= 1
        }
        head += 1
      }

      result = max(result, tail - head + 1)
    }

    return result == Int.min ? (zeros <= K ? A.count : 0) : result
  }

  class func test() {
    /*
     |0,0,1,1,0|0|1,1,1,0,1,1,0,0,0,1,1,1,1 tail: 0, head:5
     0|0,1,1,0,0,1,1,1|0,1,1,0,0,0,1,1,1,1 tail: 1, head:9
     0,0|1,1,0,0,1,1,1,0,1,1|0,0,0,1,1,1,1 tail: 2, head:12
     */
    print(Max_Consecutive_Ones_III_1004().longestOnes_N([0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], 3))
  }
}
