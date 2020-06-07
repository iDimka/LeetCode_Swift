//
//  Remove Invalid Parentheses.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 5/10/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa
/*
 https://leetcode.com/explore/interview/card/facebook/53/recursion-3/324/
 Remove Invalid Parentheses

 Remove the minimum number of invalid parentheses in order to make the input string valid. Return all possible results.

 Note: The input string may contain letters other than the parentheses ( and ).

 Example 1:

 Input: "()())()"
 Output: ["()()()", "(())()"]
 Example 2:

 Input: "(a)())()"
 Output: ["(a)()()", "(a())()"]
 Example 3:

 Input: ")("
 Output: [""]
    Hide Hint #1
 Since we don't know which of the brackets can possibly be removed, we try out all the options!
    Hide Hint #2
 We can use recursion to try out all possibilities for the given expression. For each of the brackets, we have 2 options:
 We keep the bracket and add it to the expression that we are building on the fly during recursion.
 OR, we can discard the bracket and move on.
    Hide Hint #3
 The one thing all these valid expressions have in common is that they will all be of the same length i.e. as compared to the original expression, all of these expressions will have the same number of characters removed. Can we somehow find the number of misplaced parentheses and use it in our solution?
    Hide Hint #4
 The one thing all these valid expressions have in common is that they will all be of the same length i.e. as compared to the original expression, all of these expressions will have the same number of characters removed. Can we somehow find the number of misplaced parentheses and use it in our solution?
    Hide Hint #5
 For every left parenthesis, we should have a corresponding right parenthesis. We can make use of two counters which keep track of misplaced left and right parenthesis and in one iteration we can find out these two values.
 0 1 2 3 4 5 6 7
 ( ) ) ) ( ( ( )
 i = 0, left = 1, right = 0
 i = 1, left = 0, right = 0
 i = 2, left = 0, right = 1
 i = 3, left = 0, right = 2
 i = 4, left = 1, right = 2
 i = 5, left = 2, right = 2
 i = 6, left = 3, right = 2
 i = 7, left = 2, right = 2
 We have 2 misplaced left and 2 misplaced right parentheses.
    Hide Hint #6
 We found out that the exact number of left and right parenthesis that has to be removed to get a valid expression. So, e.g. in a 1000 parentheses string, if there are 2 misplaced left and 2 misplaced right parentheses, after we are done discarding 2 left and 2 right parentheses, we will have only one option per remaining character in the expression i.e. to consider them. We can't discard them.

 */
class Remove_Invalid_Parentheses: NSObject {
  private var result: Set<String> = []
  private var minimumRemoved = Int.max

  func removeInvalidParentheses(_ s: String) -> [String] {
    guard s.count > 0 else { return [s] }

    var candidate = ""

    recurse(s, index: 0, left: 0, right: 0, removedCount: 0, candidate: &candidate)

    return Array(result)
  }

  private func recurse(_ s: String,
                       index: Int,
                       left: Int,
                       right: Int,
                       removedCount: Int,
                       candidate: inout String) {
    if index == s.count  {
      guard right == left else { return }
      guard removedCount <= minimumRemoved else { return }

      if removedCount < minimumRemoved {
        minimumRemoved = removedCount
        result.removeAll()
        print("new min: \(minimumRemoved)")
      }
      result.insert(candidate)
    } else {
      let currentChar = s[s.index(s.startIndex, offsetBy: index)]

      if currentChar != "(" && currentChar != ")" {
        candidate.append(currentChar)
        recurse(s, index: index + 1, left: left, right: right, removedCount: removedCount, candidate: &candidate)
        candidate.removeLast()
      } else {
        recurse(s, index: index + 1, left: left, right: right, removedCount: removedCount + 1, candidate: &candidate)
        candidate.append(currentChar)

        if currentChar == "(" {
          recurse(s, index: index + 1, left: left + 1, right: right, removedCount: removedCount, candidate: &candidate)
        } else if left > right {
          recurse(s, index: index + 1, left: left, right: right + 1, removedCount: removedCount, candidate: &candidate)
        }
        candidate.removeLast()
      }
    }
  }

  class func test() {
    let input = "((())))"
    print(Remove_Invalid_Parentheses().removeInvalidParentheses(input))
  }
}
