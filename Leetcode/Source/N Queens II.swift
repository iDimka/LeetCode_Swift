//
//  N Queens II.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 3/26/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class N_Queens_II: NSObject {
  func totalNQueens(_ side: Int) -> Int { // TODO: fix, buggy implementation
    func isNotUnderAttack(row: Int, col: Int, side: Int, rows: inout [Int], hills: inout [Int], dales: inout [Int]) -> Bool {
      let res = rows[col] + hills[row - col + 2 * side] + dales[row + col];
      return res == 0
    }
    
    func backtrack(row: Int, cnt: Int, side: Int, rows: inout [Int], hills: inout [Int], dales: inout [Int]) -> Int {
      var count = cnt
      for col in (0..<side) where isNotUnderAttack(row: row, col: col, side: side, rows: &rows, hills: &hills, dales: &dales) {
        rows[col] = 1
        hills[row - col + 2 * side] = 1
        dales[row + col] = 1
        
        if row + 1 == side {
          count += 1
        } else {
          count = backtrack(row: row + 1, cnt: count, side: side, rows: &rows, hills: &hills, dales: &dales)
        }
        
        rows[count] = 0
        hills[row - count + 2 * side] = 0
        dales[row + count] = 0
      }
      
      return count
    }
    
    var rows = Array<Int>(repeating: 0, count: side)
    var hills = Array<Int>(repeating: 0, count: 4 * side - 1)
    var dales = Array<Int>(repeating: 0, count: 2 * side - 1)
    
    return backtrack(row: 0, cnt: 0, side: side, rows: &rows, hills: &hills, dales: &dales)
  }
  
  class func test() {
    print(N_Queens_II().totalNQueens(4))
  }
}
