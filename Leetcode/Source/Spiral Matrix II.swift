//
//  Spiral Matrix II.swift
//  Leetcode
//
//  Created by Dzmitry Sazanovich on 9/7/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa
/*
 https://leetcode.com/problems/spiral-matrix-ii/
 */
class Spiral_Matrix_II: NSObject {
  func generateMatrix(_ n: Int) -> [[Int]] {
    guard n > 0 else { return [] }

    var result: [[Int]] = Array(repeating:Array(repeating: 0, count: n), count: n)
    var current: (row: Int, col: Int) = (0, 0)
    let dirs = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    var dirIndex = 0

    for index in 1...n*n {

      print(current)
      result.forEach{ print($0)}
      result[current.row][current.col] = index

      let new = (row: dirs[dirIndex].0 + current.row, col: dirs[dirIndex].1 + current.col)
      if new.row >= 0, new.row < n, new.col >= 0,  new.col < n, result[new.row][new.col] == 0 {
        current = new
      } else {
        dirIndex = (dirIndex + 1).quotientAndRemainder(dividingBy: 4).remainder
        print("Change dir to \(dirIndex)")
        current = (row: dirs[dirIndex].0 + current.row, col: dirs[dirIndex].1 + current.col)
      }
    }

    return result
  }

  class func test() {
    let input = 3
    let solution = Spiral_Matrix_II()
    solution.generateMatrix(input).forEach({ print($0)})
  }
}
