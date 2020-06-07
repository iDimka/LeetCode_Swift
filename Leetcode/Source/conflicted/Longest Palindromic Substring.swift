//
//  Longest Palindromic Substring.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 4/21/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

class Longest_Palindromic_Substring2: NSObject {
  func longestPalindrome(_ s: String) -> String {
    guard s.isEmpty == false else { return s }

    let inputLength = s.count

    var cache: [[Bool]] = Array<[Bool]>(repeating: Array<Bool>(repeating: false, count: inputLength), count: inputLength)
    var first = 0
    var maxLen = 1

    for start in 1..<s.count {
      for end in 0...start {

        if s[s.index(s.startIndex, offsetBy: end)] == s[s.index(s.startIndex, offsetBy: start)] {
          if (start - end) < 3 {
            cache[end][start] = true
          } else if cache[end + 1][start - 1] {
            cache[end][start] = true
          }
        }

        if cache[end][start] == true, maxLen < start - end + 1 {
          maxLen = start - end + 1;
          first = end;
        }
      }
    }

    let startIndex = s.index(s.startIndex, offsetBy: first)
    _ = s.index(startIndex, offsetBy: maxLen)
    //    return s[start..<start+maxLen]
    //    return s[startIndex..<endIndex]
    cache.forEach { print($0) }
    print("start: \(first) len: \(maxLen)")
    return ""
  }

  func brutforce(_ array: [Int]) {
    var result = [[Int]]()

    for ind in 0..<array.count {
      for inInd in ind..<array.count {
        result += [Array(array[ind...inInd])]
      }
    }


    result.forEach { print($0.map(String.init).joined(separator: ","))}
  }

  func palindrome(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }

    var cache = Array<[Bool]>(repeating: Array<Bool>(repeating: false, count: array.count), count: array.count)
    var maxLenght = 1
    var first = 0

    for ind in 0..<array.count - 1 {
      cache[ind][ind] = true
      if array[ind] == array[ind + 1] {
        cache[ind][ind + 1] = true
        maxLenght = 2
        first = ind
      }
    }

    cache[array.count - 1][array.count - 1] = true

    for lenght in (maxLenght + 1)...array.count {
      for start in 0..<array.count - lenght + 1 {

        let end = start + lenght - 1;

        if array[start] == array[end] && cache[start + 1][end - 1] {
          cache[start][end] = true

          if lenght > maxLenght {
            maxLenght = lenght
            first = start
          }
        }
      }
    }

    cache.forEach { print($0) }
    print("start \(first) len \(maxLenght)")
    print(Array(array[first..<first+maxLenght]).map(String.init).joined(separator:"")

)
    return Array(array[first..<first+maxLenght])
  }

  class func test() {
    let solution = Longest_Palindromic_Substring2()
    let input = "11112211"
    print(input.compactMap { Int(String($0)) })
//    solution.brutforce(input.compactMap { Int(String($0)) })

    print(solution.palindrome([1,0,1,0,2]))
  }
}
