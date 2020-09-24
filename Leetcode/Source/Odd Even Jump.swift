//
//  Odd Even Jump.swift
//  Leetcode
//
//  Created by Dzmitry Sazanovich on 9/22/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

class Odd_Even_Jump: NSObject {
  func oddEvenJumpsWithCache(_ A: [Int]) -> Int { // 18 of 64
      var result = 0
      var mins = Array(repeating: (0, 0), count: A.count)
      var maxs = Array(repeating: (0, 0), count: A.count)

      var minValue = Int.max
      var maxValue = Int.min
      for (ind, num) in A.enumerated().reversed() {
          minValue = min(minValue, num)
          maxValue = max(maxValue, num)
          mins[ind] = (ind, minValue)
          maxs[ind] = (ind, maxValue)
      }

      print(mins)
      print(maxs)

      for ind in A.indices {
        // print("start: \(ind)")
        var index = ind
        var jumpNumber = 1
          while index < A.count - 1 {

              if jumpNumber.quotientAndRemainder(dividingBy: 2).remainder == 1 {
                  // A[i] <= A[j] and A[j] is the smallest
                  let (newIndex, min) = mins[index + 1]
                  guard min >= A[index] else { result -= 1; break }
                  index = newIndex
              } else {
                  // A[i] >= A[j] and A[j] is the largest
                  let (newIndex, maxValue) = maxs[index + 1]
                  guard maxValue <= A[index] else { result -= 1; break }
                  index = newIndex
              }
              jumpNumber += 1
          }
          result += 1
          // print("jumps: \(jumpNumber) result: \(result)")
      }

      return result
  }
  func oddEvenJumps(_ A: [Int]) -> Int { // 56 of 64, Time Limit Exceeded
      var result = 0

      for ind in A.indices {
          print("start: \(ind)")
          var index = ind
          var jumpNumber = 1
          while index < A.count - 1 {
              let subarray = A[(index + 1)...]
              if jumpNumber.quotientAndRemainder(dividingBy: 2).remainder == 1 {
                  // A[i] <= A[j] and A[j] is the smallest
                  guard let minValue = subarray.filter ({ $0 >= A[index] }).min() else {
                      result -= 1
                      print("bracke 1 \(index)")
                      break
                  }
                  guard let newIndex = subarray.firstIndex(of: minValue) else { return 11111 }
                  print("1 newIndex: \(newIndex) from: \(index)")
                  index = newIndex
              } else {
                  // A[i] >= A[j] and A[j] is the largest
                  guard let maxValue = subarray.filter ({ $0 <= A[index] }).max() else {
                      result -= 1
                      print("bracke 0 \(index)")
                      break
                  }
                  guard let newIndex = subarray.firstIndex(of: maxValue) else { return 222222 }
                  print("1 newIndex: \(newIndex) from: \(index)")
                  index = newIndex
              }
              jumpNumber += 1
          }
          result += 1
          print("jumps: \(jumpNumber) result: \(result)")
      }

      return result
  }

  class func test() {
    let input = [10,13,12,14,15]
    print(Odd_Even_Jump().oddEvenJumps(input))
  }
}
