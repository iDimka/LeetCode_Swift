//
//  amazon.swift
//  Leetcode
//
//  Created by Dzmitry Sazanovich on 8/30/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

class AmazonVideo: NSObject {
  func lengthEachScene(inputList:[Character]) -> [Int]
  {
      // 1) Find borders
      // detect sequences
      var result: [Int] = []
      var index = 0
      print("start")


      while index < inputList.count {
          let cand = Array(inputList.suffix(inputList.count - index))
          print("cand: \(cand)")
          let res = endIndex(cand)
          index += res + 1
          result += [res + 1]
          print("index: \(result)")
      }

      return result
  }
  func endIndex(_ list: [Character]) -> Int {
    guard list.count > 0 else { return 0 }

    var count = 0
    for ind in list.indices {
        if list[ind] == list[0] {
            count = ind
        }
    }
    return count > 1 ? count : list.count
  }
  class func test() {
    let input = "zzcbzchfihi"
    let solution = AmazonVideo()
    print(solution.lengthEachScene(inputList: input.map { $0 })) // should be 6, 5
  }
}
