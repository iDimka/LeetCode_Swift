//
//  QuickSort.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 3/23/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Foundation

final class QuickSort {
  func quickSort(_ array: inout [Int]) {
    func sort(_ array: inout [Int], low: Int, high: Int) {
      guard high > low else { return }
      
      let pivot = partition(&array, low: low, high: high)
      sort(&array, low: low, high: pivot - 1)
      sort(&array, low: pivot + 1, high: high)
    }
    
    func partition(_ array: inout [Int], low: Int, high: Int) -> Int {
      let pivotValue = array[high]
      var i = low
      
      for index in (low..<high) {
        if array[index] < pivotValue {
          array.swapAt(index, i)
          i += 1
        }
      }
      array.swapAt(i, high)
      return i
    }
    
    sort(&array, low: 0, high: array.count - 1)
  }
  
  class func test() {
    var input = [1,5,3,2,8,7,6,4]
    QuickSort().quickSort(&input)
    print(input)
  }
}
