//
//  Letter Combinations of a Phone Number.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 3/19/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Letter_Combinations_of_a_Phone_Number: NSObject {
    let mapping: [Character: String] = [
        "2": "ABC",
        "3": "def",
        "4": "ghi",
        "5": "jkl",
        "6": "mno",
        "7": "pqrs",
        "8": "tuv",
        "9": "wxyz"]
    
    var output: String = ""
    
    func permutate(_ input: String, _ letters: [String]) {
        guard letters.isEmpty == false else { return }
        
        for letter: Character in letters.first! {
            output += letter.string
            print("letter: \(letter) out: \(output) letters: \(letters.joined(separator: " "))")
            permutate(output, letters.dropFirst().array)
        }
    }
    
    func letterCombinations(_ digits: String) -> String {
        let stringsArray = digits.compactMap { mapping[$0] }
        permutate("", stringsArray)
        
        return output
    }
    
    class func test() {
        let input = "23"
        
        print(Letter_Combinations_of_a_Phone_Number().letterCombinations(input))
    }
  
  /*
   Letter Combinations of a Phone Number https://leetcode.com/explore/interview/card/facebook/53/recursion-3/267/

   Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent.

   A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

   http://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Telephone-keypad2.svg/200px-Telephone-keypad2.svg.png

   Example:

   Input: "23"
   Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
   Note:

   Although the above answer is in lexicographical order, your answer could be in any order you want.
   */
  class Solution {
      let mapping = [
          "2": "abc",
          "3": "def",
          "4": "ghi",
          "5": "jkl",
          "6": "mno",
          "7": "pqrs",
          "8": "tuv",
          "9": "wxyz"]
      
      func letterCombinations(_ digits: String) -> [String] {
          guard digits.count > 0 else { return [] }
          
          var result = [String]()
          
          permutate(digits, comb: "", start: 0, result: &result)
          
          return result
      }
      
      private func permutate(_ digits: String, comb: String, start: Int, result: inout [String]) {
          guard start < digits.count else { result.append(comb); return }
          
          let startIndex = digits.index(digits.startIndex, offsetBy: start)
          let endIndex = digits.index(startIndex, offsetBy: 1)
          
          let digit = String(digits[startIndex..<endIndex])
          
          for character in mapping[digit]! {
              permutate(digits, comb: comb + String(character), start: start + 1, result: &result)
          }
      }
  }
}

extension DropFirstSequence {
    var array: [Element] { Array(self) }
}

extension Character {
    var string: String { "\(self)" }
}
