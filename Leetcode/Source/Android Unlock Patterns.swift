//
//  Android Unlock Patterns.swift
//  Leetcode
//
//  Created by Dzmitry Sazanovich on 7/28/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

class Android_Unlock_Patterns: NSObject {
  var result: [[Int]] = []
  var count = 0
  var dirs = [(-1, 0), (0, 1), (1, 0), (0, -1), (2, 1), (1, 2), (-2, 1), (2, -1), (-2, -1)]

  func numberOfPatterns(_ m: Int, _ n: Int) -> Int {
      for row in 0...2 {
          for col in 0...2 {
              print("new")
              let number = row * 3 + col + 1
              var used: Set<Int> = [number]
              var path: [Int] = [number]
              dfs(m, n, row: row, col: col, len: 1, path: &path, used: &used)
          }
      }

    print(result.sorted(by: { $0.count < $1.count }))

      return count
  }

  private func dfs(_ m: Int, _ n: Int, row: Int, col: Int,
                   len: Int, path:inout [Int], used: inout Set<Int>) {
      print("\(row):\(col) \(len)")
      if len >= m && len <= n {
        if result.contains(path) {
          print("duplicate \(path)")
        }
          result.append(path)
          count += 1
      }

      guard len <= n else { return }

      for dir in dirs {
          let newRow = row + dir.0
          let newCol = col + dir.1
          let number = newRow * 3 + newCol + 1

          guard used.contains(number) == false else { continue }
          guard newRow >= 0, newRow < 3, newCol >= 0 , newCol < 3 else { continue }

          path += [number]
//          matrix.insert(number)

        dfs(m, n, row: newRow, col: newCol, len: len + 1, path: &path, used: &used)
        //backtrack
          path.removeAll(where: { $0 == number })
//          matrix.remove(number)
      }
  }

  class func test() {
    let solution = Android_Unlock_Patterns()
    print(solution.numberOfPatterns(1, 2))
  }
}
