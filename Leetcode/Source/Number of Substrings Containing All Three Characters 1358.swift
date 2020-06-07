//
//  Number of Substrings Containing All Three Characters 1358.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 5/31/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

class Number_of_Substrings_Containing_All_Three_Characters_1358: NSObject {
  func numberOfSubstrings_Npow2(_ s: String) -> Int {
    var result = 0

    var head = s.startIndex
    var tail = s.startIndex

    while tail < s.endIndex {

      var counter = Set<Character>()
      while head < s.endIndex {
        let char = s[head]
        counter.insert(char)

        head = s.index(after: head)

        if counter.count >= 3 {
          result += 1
        }
      }
      tail = s.index(after: tail)
      head = tail
    }

    return result
  }

  func numberOfSubstrings(_ s: String) -> Int {
    var head = s.startIndex
    var tail = s.startIndex
    var counter = [Character: Int]()
    var result = 0

    while head < s.endIndex {
      counter.increase(s[head])

      while tail < head, counter.count > 2 {
        counter.decrease(s[tail])

        print("\(s.count - s.distance(from: tail, to: head)): result: \(s.count)")
        result += s.count - s.distance(from: tail, to: head) //+ 1
        tail = s.index(after: tail)
      }

      head = s.index(after: head)
    }

    return result
  }

  
  class func test() {
    print(Number_of_Substrings_Containing_All_Three_Characters_1358().numberOfSubstrings("aaacb"))
  }
}

extension Dictionary where Value == Int {
  mutating func increase(_ key: Key) {
    self[key, default: 0] += 1
  }

  mutating func decrease(_ key: Key) {
    self[key, default: 0] -= 1
    if self[key, default: 0] == 0 {
      self[key] = nil
    }
  }
}
