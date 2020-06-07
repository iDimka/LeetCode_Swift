//
//  Sudoku Solver.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 3/31/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

/*
class Sudoku_Solver: NSObject {
  typealias Board = [[Character]]
  
  func solveSudoku(_ board: inout [[Character]]) {
    solve(&board, row: 0, col: 0)
  }
  
  func solve(_ board: inout [[Character]], row: Int, col: Int) {
    guard isSolved(board: &board) == false else { return }
      
      for index in (0..<9) {
          let rowSum = currentSum(row: index, board: board)
          let colSum = currentSum(col: index, board: board)
          
          
      }
  }
  
  func checkRow(_ row: Int, in board: [[Character]]) {
    for _ in board[row] {
          
      }
  }
  
  func rowDotPosition(for board: [[Character]], in row: Int) -> Int? {
    return board[row].firstIndex(of: ".")
  }
  
  func colDotPosition(for board: [[Character]], in col: Int) -> Int? {
    return board.map { $0[col] }.firstIndex(of: ".")
  }
  
  func currentSum(row: Int, board: Board) -> Int {
      return board[row].filter{ $0.isDigit }.reduce(0, +)
  }
  
  func currentSum(col: Int, board: Board) -> Int {
      return board.map { $0[col] }.filter{ $0.isDigit }.reduce(0, +)
  }
  
  func isSolved(board: inout [[Character]]) -> Bool {
    return board.flatMap { $0 }.contains(".")
  }
}

*/
