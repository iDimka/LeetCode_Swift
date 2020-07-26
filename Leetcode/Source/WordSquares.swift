//
//  WordSquares.swift
//  Leetcode
//
//  Created by Dzmitry Sazanovich on 7/25/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa
/*
 Given a set of words (without duplicates), find all word squares you can build from them.

 A sequence of words forms a valid word square if the kth row and column read the exact same string, where 0 ≤ k < max(numRows, numColumns).

 For example, the word sequence ["ball","area","lead","lady"] forms a word square because each word reads the same both horizontally and vertically.

 b a l l
 a r e a
 l e a d
 l a d y
 Note:

 There are at least 1 and at most 1000 words.
 All words will have the exact same length.
 Word length is at least 1 and at most 5.
 Each word contains only lowercase English alphabet a-z.
 Example 1:

 Input:
 ["area","lead","wall","lady","ball"]

 Output:
 [
   [ "wall",
     "area",
     "lead",
     "lady"
   ],
   [ "ball",
     "area",
     "lead",
     "lady"
   ]
 ]

 Explanation:
 The output consists of two word squares. The order of output does not matter (just the order of words in each word square matters).
 Example 2:

 Input:
 ["abat","baba","atan","atal"]

 Output:
 [
   [ "baba",
     "abat",
     "baba",
     "atan"
   ],
   [ "baba",
     "abat",
     "baba",
     "atal"
   ]
 ]

 Explanation:
 The output consists of two word squares. The order of output does not matter (just the order of words in each word square matters).
 */

class WordSquares {
  var workArray: [String] = []
  var result: [[String]] = []
  var size = 0

  func wordSquares(_ words: [String]) -> [[String]] {
    guard words.count > 0 else { return [] }
    guard words.count > 1 else { return words[0].count == 1 ? [words] : [] }

    size = words[0].count

    for word in words {
      var words = words
      workArray.append(word)
      tryOption(in: &words, limit: 1)
      workArray.removeLast()
    }
    return result
  }

  private func tryOption(in words:inout [String], limit: Int) {
    guard workArray.count < size else { return result.append(workArray) }

    let prefix = workArray.map { String($0[$0.index($0.startIndex, offsetBy: limit)]) }.joined()
    let list = words.filter { $0.hasPrefix(prefix) }

    outerLoop: for candidate in list {
      workArray.append(candidate)
      tryOption(in: &words, limit: limit + 1)
      workArray.removeLast()
    }
  }

  class func test() {
    let input = ["abat","baba","atan","atal"]
    let solution = WordSquares()

    print(solution.wordSquares(input))
  }
}
