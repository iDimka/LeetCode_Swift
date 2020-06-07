//
//  Max Consecutive Ones.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 4/25/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Max_Consecutive_Ones: NSObject {
  func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    guard nums.count > 0 else { return 0 }
    
    var result = 0
    var lastOne = false
    var currentCycle = 0
    
    for num in nums {
      if num == 1 {
        currentCycle += 1
        result = max(result, currentCycle)
      } else {
        lastOne = false
        currentCycle = 0
      }
    }
    
    return result
  }
  
  class func test() {
    let solution = Max_Consecutive_Ones()
    let input = [1,1,1,0,1,1,0,1]
    print(solution.findMaxConsecutiveOnes(input))
  }
}
