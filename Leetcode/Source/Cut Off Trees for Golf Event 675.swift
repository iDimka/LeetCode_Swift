//
//  Cut Off Trees for Golf Event 675.swift
//  Leetcode
//
//  Created by Dzmitry Sazanovich on 8/29/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

class Cut_Off_Trees_for_Golf_Event_675: NSObject {
  struct Place {
    let row: Int; let col: Int; let val: Int
  }

  var dirs = [(0, -1), (-1, 0), (0, 1), (1, 0)]

  func cutOffTree(_ forest: [[Int]]) -> Int {
    let sorted = sortedPaces(with: forest)

    guard sorted.count > 1 else { return -1 }

    var index = 0
    var count = 0

    while index < sorted.count - 1 {
      var visited: Set<Int> = []
      let dist = dfs(forest, from: sorted[index], to: sorted[index + 1], dist: 0, &visited)
      guard dist != Int.max  else { return -1 }
      count += dist
      index += 1
    }

    return count
  }

  func dfs(_ matrix: [[Int]], from: Place, to: Place, dist: Int, _ visited: inout Set<Int>) -> Int {
    guard from.val != to.val else { return dist }
    guard visited.contains(from.val) == false else { return Int.max }
    guard matrix[from.row][from.col] != 0 else { return Int.max }

    visited.insert(from.val)

    var minPath = Int.max
    for dir in dirs {
      let row = from.row + dir.0
      let col = from.col + dir.1

      guard isValid(row, col, in: matrix) else { continue }

      let newFrom = Place(row: row, col: col, val: matrix[row][col])
      let path = dfs(matrix, from: newFrom, to: to, dist: dist + 1, &visited)

      minPath = min(minPath, path)
    }

    return minPath
  }

  func isValid(_ row: Int, _ col: Int, in matrix: [[Int]]) -> Bool {
    guard row >= 0, row < matrix.count, col >= 0, col < matrix[row].count else {
      return false
    }

    return true
  }

  func sortedPaces(with forest: [[Int]]) -> [Place] {
    var sorted: [Place] = []

    for row in 0..<forest.count {
      for col in 0..<forest[row].count where forest[row][col] > 1 {
        sorted.append(Place(row: row, col: col, val: forest[row][col]))
      }
    }

    sorted.sort(by: { $0.val < $1.val })
    return sorted
  }

  class func test() {
    let solution = Cut_Off_Trees_for_Golf_Event_675()
    let input = [[54581641,64080174,24346381,69107959],
                 [86374198,61363882,68783324,79706116],
                 [668150,92178815,89819108,94701471],
                 [83920491,22724204,46281641,47531096],
                 [89078499,18904913,25462145,60813308]]

    print(solution.cutOffTree(input))
  }
}
