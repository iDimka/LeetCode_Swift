//
//  Longest Substring with At Most K Distinct Characters.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 6/5/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

/*
 https://leetcode.com/explore/interview/card/facebook/5/array-and-strings/3017/

 Given a string, find the length of the longest substring T that contains at most k distinct characters.

 Example 1:

 Input: s = "eceba", k = 2
 Output: 3
 Explanation: T is "ece" which its length is 3.
 Example 2:

 Input: s = "aa", k = 1
 Output: 2
 Explanation: T is "aa" which its length is 2.
 */
class Longest_Substring_with_At_Most_K_Distinct_Characters: NSObject {
  func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
    guard s.count > 0 else { return 0 }

    var result = 0
    var head = s.startIndex
    var tail = s.startIndex
    var hashMap: [Character: Int] = [:]
    // s = "eceba", k = 2
    while tail < s.endIndex, tail <= head {
      while head < s.endIndex {
        hashMap[s[head], default: 0] += 1
        print("\(s[tail...head]), \(s.distance(from: tail, to: head) + 1) - \(hashMap.map { "\($0.0):\($0.1)" })")
        if hashMap.count <= k {
          result = max(result, s.distance(from: tail, to: head) + 1)
        } else {
          head = s.index(after: head)
          break
        }
        head = s.index(after: head)
      }

      hashMap[s[tail], default: 0] -= 1
      if hashMap[s[tail], default: 0] <= 0 {
        hashMap[s[tail]] = nil
      }
      tail = s.index(after: tail)
    }

    return result
  }

  func lengthOfLongestSubstringKDistinct_N(_ s: String, _ k: Int) -> Int {
    guard k > 0 else { return 0 }
    guard s.count > 0 else { return 0 }

    var result = 0
    var head = s.startIndex
    var tail = s.startIndex
    var hashMap: [Character: String.Index] = [:]
    // s = "eceba", k = 2
    while head < s.endIndex {
      hashMap[s[head]] = head
      head = s.index(after: head)
      // print(hashMap.count)
      if hashMap.count == (k + 1), let minInd = hashMap.values.min() {
        hashMap[s[minInd]] = nil;
        tail = s.index(after: minInd)
      }
      // print(s[tail..<head])
      result = max(result, s.distance(from: tail, to: head))
    }

    return result
  }

  class func test() {
    let input = "bacc"
    let solution = Longest_Substring_with_At_Most_K_Distinct_Characters()

    print(solution.lengthOfLongestSubstringKDistinct_N(input, 2))
  }
}
