//
//  Add and Search Word - Data structure design 211.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 5/17/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa
/*
 https://leetcode.com/problems/add-and-search-word-data-structure-design/

 Design a data structure that supports the following two operations:

 void addWord(word)
 bool search(word)
 search(word) can search a literal word or a regular expression string containing only letters a-z or .. A . means it can represent any one letter.

 Example:

 addWord("bad")
 addWord("dad")
 addWord("mad")
 search("pad") -> false
 search("bad") -> true
 search(".ad") -> true
 search("b..") -> true
 Note:
 You may assume that all words are consist of lowercase letters a-z.
 */
class Add_and_Search_Word___Data_structure_design_211: NSObject {
  class WordDictionary {
    class Node {
      var isEnd = false
      var data: [Node?] = Array(repeating: nil, count: 26)

      func getNode(by char: Character) -> Node? {
        guard let index = char.asciiValue?.intValue.asciiOrderNumber else { return nil }
  // print("get: \(index) chhar: \(char)")
        return data[index]
      }

      func insert(char: Character, node: Node) -> Bool {
        guard let index = char.asciiValue?.intValue.asciiOrderNumber else { return false }
          // print("insert: \(index)")
        data[index] = node
        return true
      }

        func getExistingNodes() -> [Node] {
            return data.compactMap { $0 }
        }
    }

      var root: Node

      /** Initialize your data structure here. */
      init() {
          self.root = Node()
      }

      /** Adds a word into the data structure. */
      func addWord(_ word: String) {
          var node: Node? = root

          for char in word {
             if node?.getNode(by: char) == nil {
                node?.insert(char: char, node: Node())
              }
              node = node?.getNode(by: char)
            }

        node?.isEnd = true
      }

      /** Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter. */
      func search(_ word: String) -> Bool {
       let nodes = search(word: word)

        return nodes.first(where: { $0.isEnd == true }) != nil
      }

      private func search(word: String) -> [Node] {
        var nodes = [root]

        for char in word {
              guard char != "." else {
                  nodes = nodes.compactMap { $0.getExistingNodes() }.flatMap { $0 }
                  print("get all existing count \(nodes.count)")
                  continue
              }

              nodes = nodes.compactMap { $0.getNode(by: char) }

              if nodes.count == 0 {
                  print("zero nodes for \(word)")
                  return []
              }
        }

        return nodes
      }
  }

  class func test() {
     let tree = WordDictionary()
     let input = [
       "run",
       "rune",
       "runner",
       "runs",
       "road",
       "add",
       "adds",
       "adder",
       "addee",
     ]

     input.forEach(tree.addWord(_:))

     print(tree.search("add."))
   }
//  extension Int {
//    var asciiOrderNumber: Int { return  self - Character("a").asciiValue!.intValue }
//  }
//
//  extension UInt8 {
//    var intValue: Int { return Int(self) }
//  }
  /**
   * Your WordDictionary object will be instantiated and called as such:
   * let obj = WordDictionary()
   * obj.addWord(word)
   * let ret_2: Bool = obj.search(word)
   */
}
