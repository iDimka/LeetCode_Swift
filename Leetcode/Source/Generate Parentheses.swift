//
//  Generate Parentheses.swift
//  Leetcode
//
//  Created by Dzmitry Sazanovich on 9/11/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

class Generate_Parentheses: NSObject {
  func generateParenthesis(_ n: Int) -> [String] {
      guard n > 0 else { return [] }
      guard n > 1 else { return ["()"] }
      var result = [String]()

      generate(open: 0, close: 0, max: n * 2, current: "", result: &result)

      return result
  }

  func generate(open: Int, close: Int, max: Int, current: String, result: inout [String]) {
    (0..<(open + close)).forEach { _ in print("|", separator: "", terminator: "") }
      print("\(open):\(close): \(current)")
      guard current.count < max else {
          if open == close {
              result.append(current)
          }
          return
      }

      if open < max {
          generate(open:open+1, close:close, max: max, current: current+"(", result: &result)
      }
      if open > close {
          generate(open:open, close:close+1, max: max, current: current+")", result: &result)
      }
  }

  class func test() {
    let input = 2
    let solution = Generate_Parentheses()
    print(solution.generateParenthesis(input))
  }
}
