//
//  Shortest Distance from All Buildings.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 5/28/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa
/*
 https://leetcode.com/explore/interview/card/facebook/52/trees-and-graphs/3026/

 You want to build a house on an empty land which reaches all buildings in the shortest amount of distance. You can only move up, down, left and right. You are given a 2D grid of values 0, 1 or 2, where:

 Each 0 marks an empty land which you can pass by freely.
 Each 1 marks a building which you cannot pass through.
 Each 2 marks an obstacle which you cannot pass through.
 Example:

 Input: [[1,0,2,0,1],[0,0,0,0,0],[0,0,1,0,0]]

 1 - 0 - 2 - 0 - 1
 |   |   |   |   |
 0 - 0 - 0 - 0 - 0
 |   |   |   |   |
 0 - 0 - 1 - 0 - 0

 Output: 7

 Explanation: Given three buildings at (0,0), (0,4), (2,2), and an obstacle at (0,2),
 the point (1,2) is an ideal empty land to build a house, as the total
 travel distance of 3+3+1=7 is minimal. So return 7.
 Note:
 There will be at least one building. If it is not possible to build such house according to the above rules, return -1.

 */

class Shortest_Distance_from_All_Buildings: NSObject {
  struct Point: Hashable {
    let row: Int
    let col: Int
  }

  let directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]

  func shortestDistance(_ grid: [[Int]]) -> Int {
    // guard grid.count > 1, grid[0].count > 1 else { return -1 }
    var minDist = Int.max

    var numberOfBuildings = 0
    for row in 0..<grid.count {
      for col in 0..<grid[0].count where grid[row][col] == 1 {
        numberOfBuildings += 1
      }
    }


    for row in 0..<grid.count {
      for col in 0..<grid[0].count {
        guard grid[row][col] == 0 else { continue }
        // print("\(row):\(col)")

        var queue:Set<Point> = [Point(row: row, col: col)]
        var visited: Set<Point> = []
        var visitedBuildings = 0
        var minCurrentDidst = 0
        var level = 0

        outerLoop: while queue.isEmpty == false {
          let points = queue.filter { isValid($0, in: grid) }.filter { visited.contains($0) == false }
          // print("points \(points.count)")
          queue.removeAll()

          for point in points  {
            guard visited.contains(point) == false else { continue }
            visited.insert(point)

            if grid[point.row][point.col] == 1 {
              visitedBuildings += 1
              minCurrentDidst += level
              // print("visited: \(visitedBuildings) dist \(minCurrentDidst) \(point.row):\(point.col)")
              if visitedBuildings == numberOfBuildings {
                minDist = min(minDist, minCurrentDidst)
                // print("updated min \(minDist)")
                break outerLoop
              }
              continue
            }

            directions
              .map { Point(row: point.row + $0, col: point.col + $1) }
              .filter { visited.contains($0) == false }
              .forEach { queue.insert($0) }
          }
          level += 1
        }
      }
    }

    return minDist == Int.max ? -1 : minDist
  }

  private func isValid(_ point: Point, in grid: [[Int]]) -> Bool {
    guard point.row >= 0 && point.row < grid.count else { return false }
    guard point.col >= 0 && point.col < grid[0].count else { return false }
    guard grid[point.row][point.col] != 2 else {
      return false
    }

    return true
  }

  class func test() {
    let input = [[2,2,2,2,0,2,2,0,0,0,2,0,0,0,0,0,0,0,0,0,2,2,0,1,0,0,0,0,0,2,2,2,0,0,0,0,0,2,2,2,0,2,0,0],[0,0,2,2,0,0,0,2,0,0,2,2,0,0,0,0,2,0,2,1,0,2,0,1,2,2,2,0,0,2,0,2,2,0,0,0,0,2,2,0,2,1,2,0],[1,0,0,0,0,2,2,0,0,2,0,0,1,0,0,2,0,0,2,0,0,0,2,0,0,2,0,0,0,0,1,0,0,2,0,2,2,2,0,2,0,2,2,0],[1,0,2,0,0,2,0,0,2,0,0,2,2,2,2,2,2,2,2,0,0,0,0,0,0,0,0,0,2,0,0,2,0,0,0,0,2,0,0,0,0,0,0,0],[0,0,2,0,0,0,0,0,0,0,2,0,2,0,1,0,2,2,2,0,0,0,2,2,2,2,2,0,0,0,0,0,0,0,2,0,2,0,1,0,2,2,0,2],[2,0,0,0,0,2,0,0,2,2,2,2,0,0,2,2,2,0,0,0,0,2,0,0,0,0,2,0,2,0,2,0,1,2,0,2,2,0,0,0,2,0,0,2],[0,0,0,2,2,2,0,2,0,0,0,2,0,0,2,0,2,0,2,0,0,2,0,2,0,1,0,2,2,0,0,2,0,0,0,2,2,2,2,0,0,0,2,0],[2,0,0,2,0,2,2,2,2,0,0,2,2,0,2,0,0,0,1,2,0,2,2,0,2,0,2,1,2,0,1,0,2,1,2,0,0,0,0,0,0,0,2,2],[0,0,2,2,0,2,0,0,0,2,0,2,0,2,2,0,2,0,0,0,0,0,0,0,2,0,0,2,1,2,0,0,0,2,1,0,2,2,2,0,0,0,2,0],[2,0,0,0,0,2,0,0,2,2,2,2,0,2,0,0,2,0,0,0,0,2,0,0,0,0,0,2,1,0,0,2,2,2,1,2,2,0,0,0,0,0,2,2],[0,1,0,2,0,0,2,0,0,2,0,0,0,0,0,0,1,2,0,2,2,2,2,0,0,2,2,2,0,2,0,2,2,2,0,0,2,0,0,0,0,0,2,2],[0,2,0,0,0,2,0,2,2,2,0,0,1,2,0,0,2,0,2,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,2,0,0,2],[2,2,2,2,2,2,0,0,0,0,0,2,0,2,2,2,0,2,0,2,0,2,2,0,2,0,0,0,2,0,0,2,2,2,2,2,0,0,0,2,0,2,2,0],[0,0,2,0,2,2,0,0,0,0,0,0,2,2,0,2,0,2,2,0,0,0,0,0,2,2,1,0,0,1,2,0,2,0,0,0,0,2,0,2,0,2,0,0],[0,2,2,0,0,0,0,2,0,0,0,2,0,2,2,0,0,2,0,0,0,0,0,2,0,0,0,0,0,2,0,0,0,0,2,0,0,0,0,2,0,2,0,0],[0,0,0,0,0,2,2,0,2,2,0,0,0,2,2,2,0,2,2,0,2,0,2,0,2,2,0,1,0,2,0,2,0,0,2,0,0,0,0,0,0,2,0,2],[2,2,0,2,0,0,1,2,0,1,0,2,0,0,2,0,1,2,1,2,2,0,2,0,0,0,0,2,2,2,0,2,0,2,0,2,0,0,0,0,0,0,0,2],[0,2,2,0,2,0,0,1,0,0,0,0,2,0,0,0,0,0,2,2,0,2,0,0,2,0,0,0,0,0,2,0,0,2,0,0,0,0,0,2,2,0,2,2],[0,2,2,0,0,2,2,0,2,0,0,0,0,0,2,2,0,0,0,2,2,2,1,0,2,2,0,2,0,0,2,0,0,0,1,2,0,2,2,0,0,0,0,0],[0,1,0,0,0,0,0,0,0,0,0,0,2,0,0,0,2,2,2,0,0,0,2,2,1,0,0,2,2,0,2,0,2,0,1,0,2,0,0,0,0,2,0,2],[0,0,2,2,0,0,2,0,2,0,2,2,0,0,2,0,0,0,0,0,0,2,0,0,0,0,0,0,2,0,0,2,0,0,2,0,2,0,0,0,0,0,0,0],[0,2,2,2,2,0,0,2,0,0,2,2,0,0,0,2,0,0,2,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,1,2],[2,2,2,0,0,2,0,0,0,0,0,2,0,0,2,2,0,0,2,0,2,0,0,0,2,0,2,2,0,0,0,2,2,0,0,2,0,0,2,0,2,2,0,2],[2,0,0,2,2,2,0,0,0,2,2,0,0,0,0,0,2,0,0,0,0,0,2,0,0,2,0,1,0,1,0,0,2,0,2,0,2,0,2,1,0,2,0,0],[2,0,0,2,2,0,0,0,0,0,2,0,0,0,2,2,2,0,0,2,0,0,2,0,0,2,2,2,2,2,2,0,0,0,2,0,0,2,2,1,0,0,0,2],[1,0,2,0,2,0,0,2,0,0,0,2,0,1,0,0,2,2,0,0,2,0,2,0,2,2,0,0,0,2,0,0,0,0,2,2,2,2,0,2,2,2,0,2],[0,0,0,0,2,2,2,0,0,1,0,2,2,2,0,0,0,1,2,0,0,0,2,0,0,0,0,0,2,0,2,0,0,0,0,0,2,0,0,1,0,0,0,2],[0,2,2,0,2,0,2,1,2,2,1,0,0,0,0,0,0,0,0,0,0,0,2,2,2,0,2,2,2,0,0,2,0,2,0,2,0,0,0,2,0,0,0,0],[0,2,2,0,2,2,0,2,2,0,0,0,1,2,2,0,0,2,0,0,2,2,2,0,2,2,2,0,2,0,0,0,2,2,0,0,0,0,2,2,0,2,2,2],[0,0,2,0,0,0,1,2,0,2,2,2,0,0,2,2,0,0,0,2,0,0,2,0,0,2,2,2,0,2,2,0,0,0,0,2,0,0,0,0,0,0,2,2]]
    let solution = Shortest_Distance_from_All_Buildings()

    print(solution.shortestDistance(input))
  }
}
/*

 [[+,+,2,+,+],
 [+,+,+,+,+],
 [+,+,+,+,+]]
 */
