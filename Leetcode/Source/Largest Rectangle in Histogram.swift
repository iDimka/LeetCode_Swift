//
//  Largest Rectangle in Histogram.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 4/5/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Largest_Rectangle_in_Histogram: NSObject {
  func largestRectangleArea(_ heights: [Int]) -> Int {
    func divideAndConquer(_ heights: [Int], _ left: Int, _ right: Int) -> Int {
      guard right >= left else { return 0 }
      
      var minInd = left
      for ind in (left..<right) {
        if heights[minInd] > heights[ind] {
          minInd = ind
        }
      }
      
      return max(heights[minInd] * (right - left + 1),
                 divideAndConquer(heights, left, minInd - 1),
                 divideAndConquer(heights, minInd + 1, right))
    }
    
    return divideAndConquer(heights, 0, heights.count - 1)
  }
  
  class func test() {
    let input = [2,1,5,6,2,3]
    print(Largest_Rectangle_in_Histogram().largestRectangleArea(input))
  }
}
