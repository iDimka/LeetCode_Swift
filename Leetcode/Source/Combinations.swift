//
//  Combinations.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 4/2/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

class CombinationsSolution {
  var result: [[Int]] = []
  var n = 0
  var k = 0

  func combine(_ n: Int, _ k: Int) -> [[Int]] {
      self.n = n
      self.k = k

      var array = [Int]()
      backtrack(1, array: &array)
      return result
  }

  func backtrack(_ start: Int, array: inout [Int]) {
    if array.count == k {
        result.append(array)
    }

    for num in (start..<(n + 1)) {
      array.append(num)
      backtrack(num + 1, array: &array)
      array.removeLast()
    }
  }

  class func test() {
    print(CombinationsSolution().combine(8, 2))
  }
}
