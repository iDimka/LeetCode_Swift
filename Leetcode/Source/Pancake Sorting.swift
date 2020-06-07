//
//  Pancake Sorting.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 5/5/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa
// https://leetcode.com/problems/pancake-sorting/
// Explanation https://www.youtube.com/watch?v=J0DI2KEEHXI
class Pancake_Sorting: NSObject {
  class Solution {
      func pancakeSort(_ A: [Int]) -> [Int] {
          var result = [Int]()
          var A = A
          
          for number in (1...A.count).reversed() {
              guard let index = A.firstIndex(of: number) else { continue }
              print("\(number): \(index)")
              
              flip(&A, index: index)
              result.append(index + 1)
              flip(&A, index: number - 1)
              result.append(number)
          }
          
          return result
      }
      
      private func flip(_ A: inout [Int], index: Int) {
          A[0...index].reverse()
      }
  }
}
