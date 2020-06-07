//
//  Alien Dictionary.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 6/4/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa
/*
 https://leetcode.com/explore/interview/card/facebook/52/trees-and-graphs/3025/

 There is a new alien language which uses the latin alphabet. However, the order among letters are unknown to you. You receive a list of non-empty words from the dictionary, where words are sorted lexicographically by the rules of this new language. Derive the order of letters in this language.

 Example 1:

 Input:
 [
   "wrt",
   "wrf",
   "er",
   "ett",
   "rftt"
 ]

 Output: "wertf"
 Example 2:

 Input:
 [
   "z",
   "x"
 ]

 Output: "zx"
 Example 3:

 Input:
 [
   "z",
   "x",
   "z"
 ]

 Output: ""

 Explanation: The order is invalid, so return "".
 Note:

 You may assume all letters are in lowercase.
 If the order is invalid, return an empty string.
 There may be multiple valid order of letters, return any one of them is fine.
 */

class Alien_Dictionary: NSObject {
  func alienOrder(_ words: [String]) -> String {
      var adjList = [Character: [Character]]()
      var counts = [Character: Int]()

      for char in Set(words.flatMap { $0 }) {
          counts[char] = 0
      }

      for index in 0..<words.count - 1 {
          let curr = words[index]
          let next = words[index + 1]

          if curr.count > next.count, curr.hasPrefix(next) { return "" }

          for charIndex in 0..<min(curr.count, next.count) {
              let currIdx = curr.index(curr.startIndex, offsetBy: charIndex)
              let nextIdx = next.index(next.startIndex, offsetBy: charIndex)
              guard curr[currIdx] != next[nextIdx] else { continue }
              adjList[curr[currIdx], default: []] += [next[nextIdx]]
              counts[next[nextIdx], default: 0] += 1
              break
          }
      }

      print(adjList)
      print(counts)

      var result = ""
      var queue = counts.filter{ $0.1 == 0 }.map { $0.0 }
      while queue.isEmpty == false {
          let char = queue.removeLast()
          result += char.stringValue

          for next in adjList[char, default: []] {
              counts[next, default: 0] -= 1
              if counts[next, default: 0] == 0 {
                  // counts[next] = nil
                  queue.append(next)
              }
          }
      }
    if counts.count > result.count {
      return ""
    }
    // print(queue)

      return result
  }

  class func test() {
    let inputs = [
      ["abc","ab"]: "", // result "", why: curr.count > next.count, curr.hasPrefix(next)
      ["wrt","wrf","er","ett","rftt"]: "wertf", // result "wertf"
      ["ri","xz","qxf","jhsguaw","dztqrbwbm","dhdqfb","jdv","fcgfsilnb","ooby"]: "", // result "", why: counts.count > result.count
    ]
    let solution = Alien_Dictionary()

    inputs.forEach{ print("'\(solution.alienOrder($0))' vs '\($1)'") }
  }
}

extension Character {
    var stringValue: String { return String(self) }
}
