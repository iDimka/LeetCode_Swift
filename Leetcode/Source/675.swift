//
//  675.swift
//  Leetcode
//
//  Created by Dzmitry Sazanovich on 9/5/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

// https://leetcode.com/problems/cut-off-trees-for-golf-event/solution/

class CutOffTrees675: NSObject {
  struct Place: CustomStringConvertible, Hashable { let row: Int; let col: Int
    var description: String {
      return "\(row):\(col)"
    }}

  var dirs = [(-1, 0), (1, 0), (0, 1), (0, -1)]

  func cutOffTree(_ forest: [[Int]]) -> Int {
    guard forest.count > 0, forest[0].count > 0 else { return -1 }

    let sorted = sortedPaces(with: forest)

//    print("\(sorted) \n")

    var count = 0
    var current = Place(row:0, col: 0)
    var forest = forest

    for target in sorted {
      guard target != current else {
        forest[target.row][target.col] = 1
        continue
      }
      let dist = bfs(&forest, from: current, to: target)
      print("dist: \(dist) for target: \(target) in \n\(forest)\n")
      guard dist != -1 else { return -1 }
      count += dist
      current = target

    }

    return count
  }

  func bfs(_ forest:inout [[Int]], from: Place, to target: Place) -> Int {
    var queue: [((Int, Int), Int)] = [((from.row, from.col), 1)]
    var seen: Set<Int> = [from.row * forest[0].count + from.col]

    while queue.count > 0 {
        let (workNode, level) = queue.removeFirst()

        for dir in dirs {
          let row = workNode.0 + dir.0
          let col = workNode.1 + dir.1
          let index = row * forest[0].count + col

          guard isValid(row, col, in: forest) else { continue }
          guard row != target.row || col != target.col else {
            forest[row][col] = 1
            return level
          }

          guard seen.contains(index) == false else { continue }
          seen.insert(index)
          queue.append(((row, col), level + 1))
        }
    }
    print(seen)
    return -1
  }

  func dfs(_ matrix: [[Int]], from: Place, to: Place, dist: Int, _ visited: inout Set<Int>) -> Int {
    guard from.row != to.row, from.col != to.col else { return dist }
    guard visited.contains(matrix[from.row][from.col]) == false else { return Int.max }
    guard matrix[from.row][from.col] != 0 else { return Int.max }

    visited.insert(matrix[from.row][from.col])

    var minPath = Int.max
    for dir in dirs {
      let row = from.row + dir.0
      let col = from.col + dir.1

      guard isValid(row, col, in: matrix) else { continue }

      let newFrom = Place(row: row, col: col)
      let path = dfs(matrix, from: newFrom, to: to, dist: dist + 1, &visited)

      minPath = min(minPath, path)
    }

    return minPath
  }

  func isValid(_ row: Int, _ col: Int, in matrix: [[Int]]) -> Bool {
    guard row >= 0, row < matrix.count, col >= 0, col < matrix[row].count else {
      return false
    }

    return matrix[row][col] > 0
  }

  func sortedPaces(with forest: [[Int]]) -> [Place] {
    var sorted: [Place] = []

    for row in 0..<forest.count {
      for col in 0..<forest[row].count where forest[row][col] > 1 {
        sorted.append(Place(row: row, col: col))
      }
    }

    sorted.sort(by: { forest[$0.row][$0.col] < forest[$1.row][$1.col] })
    return sorted
  }

  class func test() {
    let input = [
      [63750247,40643210,95516857,89928134,66334829,58741187,76532780,45104329],
      [3219401,97566322,9135413,75944198,93735601,33923288,50116695,83660397],
      [64460750,53045740,31903386,78155821,90848739,38769489,99349027,85982891],
      [30628785,51077683,70534803,67460877,91077770,74197235,5696362,91459886],
      [56105195,82479378,45937951,52817583,2768114,43329099,28189138,21418604]]
    let solution = CutOffTrees675()
    print(solution.cutOffTree(input))
  }
}
