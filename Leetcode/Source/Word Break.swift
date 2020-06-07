//
//  Word Break.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 5/20/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa
/**
 https://leetcode.com/explore/interview/card/facebook/55/dynamic-programming-3/3036/

 Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, determine if s can be segmented into a space-separated sequence of one or more dictionary words.

 Note:

 The same word in the dictionary may be reused multiple times in the segmentation.
 You may assume the dictionary does not contain duplicate words.
 Example 1:

 Input: s = "leetcode", wordDict = ["leet", "code"]
 Output: true
 Explanation: Return true because "leetcode" can be segmented as "leet code".
 Example 2:

 Input: s = "applepenapple", wordDict = ["apple", "pen"]
 Output: true
 Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
 Note that you are allowed to reuse a dictionary word.
 Example 3:

 Input: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
 Output: false
 */
class Word_Break: NSObject {
  func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    var dp = Array<Bool>(repeating: false, count: s.count + 1)
    dp[0] = true

    for low in 0..<s.count {
      guard dp[low] == true else { continue }

      for word in wordDict {
        let end = low + word.count
        guard end <= s.count else { continue }
        let substring = s[s.index(s.startIndex, offsetBy:low)..<s.index(s.startIndex, offsetBy: end)]
        print("word: \(word), substring: \(substring)")
        if word == substring {
          dp[end] = true
        }
      }
    }

    return dp[s.count]
  }

  func wordBreak_naive_with_flaw(_ s: String, _ wordDict: [String]) -> Bool {

    var range = Array<Int>(repeating: 1, count: s.count)

    for word in wordDict {
      var localRange = s.startIndex..<s.endIndex
      while let wordRange = s.range(of: word, options: .literal, range: localRange) {
        localRange = wordRange.upperBound..<s.endIndex

        let start = wordRange.lowerBound.utf16Offset(in: s)
        let end = wordRange.upperBound.utf16Offset(in: s)

        guard range[start..<end].contains(0) == false else { continue }

        (start..<end).forEach{ index in
          range[s.distance(from: s.startIndex, to: s.index(s.startIndex, offsetBy: index))] = 0
        }
      }
    }

    return range.max() == 0
  }

  class func test() {
    let solution = Word_Break()
    let inputString = "catsanddog"
    let inputArray = ["cats","dog","sand","and","cat"]

    print(solution.wordBreak(inputString, inputArray))
  }
}
