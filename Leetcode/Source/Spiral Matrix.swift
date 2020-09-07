//
//  Spiral Matrix.swift
//  Leetcode
//
//  Created by Dzmitry Sazanovich on 9/6/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

class Spiral_Matrix: NSObject {
  func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    guard matrix.isEmpty == false, matrix[0].isEmpty == false else {
      return []
    }

    let rows = matrix.count
    let cols = matrix[0].count
    let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    var dirIndex = 0
    var result: [Int] = []
    var current = (0, 0)
    var seen: Set<Int> = []

    for ind in 0..<rows * cols { print(ind)
      result.append(matrix[current.0][current.1])
      seen.insert(matrix[current.0][current.1])

      let new = (current.0 + directions[dirIndex].0, current.1 + directions[dirIndex].1)
      if new.0 >= 0, new.0 < rows, new.1 >= 0, new.1 < cols, seen.contains(matrix[new.0][new.1]) == false {
        current = new
      } else {
        dirIndex = (dirIndex + 1).quotientAndRemainder(dividingBy: 4).remainder
        current = (current.0 + directions[dirIndex].0, current.1 + directions[dirIndex].1)
      }
    }

    return result
  }

  func spiralOrderLayered(_ matrix: [[Int]]) -> [Int] {
    guard matrix.isEmpty == false else { return [] }

    var result: [Int] = []
    var rowStart = 0; var rowEnd = matrix.count - 1
    var colStart = 0; var colEnd = matrix[0].count - 1

    while rowStart <= rowEnd && colStart <= colEnd {

      var index = colStart; while index <= colEnd { result.append(matrix[rowStart][index]); index += 1 }
      index = rowStart + 1; while index <= rowEnd { result.append(matrix[index][colEnd]); index += 1 }


      if rowStart < rowEnd && colStart < colEnd  {
        index = colEnd - 1; while index > colStart { result.append(matrix[rowEnd][index]); index -= 1 };
        index = rowEnd; while index > rowStart { result.append(matrix[index][colStart]); index -= 1 }
      }

      rowStart += 1; rowEnd -= 1
      colStart += 1; colEnd -= 1
    }

    return result
  }

  class func test() {
    let input = [[1,2,3],
                 [4,5,6],
                 [7,8,9]]
    let solution = Spiral_Matrix()
    print(solution.spiralOrder(input))
  }
}
