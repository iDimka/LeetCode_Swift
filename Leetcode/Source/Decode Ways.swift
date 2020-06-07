//
//  Decode Ways.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 4/19/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

class Decode_Ways: NSObject {
  var memo: [Int: Int] = [:]

  func recursiveWithMemo(array: [Int], index: Int) -> Int {
    guard index != array.count else { return 1 } // If you reach the end of the string Return 1 for success.
    guard array[index] != 0 else { print("zero"); return 0 } // If the string starts with a zero, it can't be decoded
    guard index != array.count - 1 else { return 1 }

    if let cached = memo[index] {
      return cached
    }

    var ans = recursiveWithMemo(array: array, index: index + 1)

    if (array[index] * 10 + array[index + 1]) < 27 {
      ans += recursiveWithMemo(array: array, index: index + 2)
    }

    memo[index] = ans

    return ans
  }

  func numDecodings(_ s: String) -> Int {
    let input = s.compactMap { Int(String($0)) }
    guard input.count > 0 else { return 0 }

    return recursiveWithMemo(array: input, index: 0)
  }

  class func test() {
    let input = "102312"
    let solution = Decode_Ways()
    print(solution.numDecodings(input))
  }
}
