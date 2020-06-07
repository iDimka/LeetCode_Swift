//
//  Binary Tree Vertical Order Traversal.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 5/7/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa
/**
 Given a binary tree, return the vertical order traversal of its nodes' values. (ie, from top to bottom, column by column).

 If two nodes are in the same row and column, the order should be from left to right.

 Examples 1:

 Input: [3,9,20,null,null,15,7]

    3
   /\
  /  \
  9  20
     /\
    /  \
   15   7

 Output:

 [
   [9],
   [3,15],
   [20],
   [7]
 ]
 Examples 2:

 Input: [3,9,8,4,0,1,7]

      3
     /\
    /  \
    9   8
   /\  /\
  /  \/  \
  4  01   7

 Output:

 [
   [4],
   [9],
   [3,0,1],
   [8],
   [7]
 ]
 Examples 3:

 Input: [3,9,8,4,0,1,7,null,null,null,2,5] (0's right child is 2 and 1's left child is 5)

      3
     /\
    /  \
    9   8
   /\  /\
  /  \/  \
  4  01   7
     /\
    /  \
    5   2

 Output:

 [
   [4],
   [9,5],
   [3,0,1],
   [8,2],
   [7]
 ]
 */
class Binary_Tree_Vertical_Order_Traversal: NSObject { // 203 / 212 test cases passed.
  /**
   * Definition for a binary tree node.
   * public class TreeNode {
   *     public var val: Int
   *     public var left: TreeNode?
   *     public var right: TreeNode?
   *     public init() { self.val = 0; self.left = nil; self.right = nil; }
   *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
   *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
   *         self.val = val
   *         self.left = left
   *         self.right = right
   *     }
   * }
   */
  class Solution {
      var sceleton: [Int: (Int, Int)] = [:]
      var minCol: Int = 0
      var maxCol: Int = 0
      
      func verticalOrder(_ root: TreeNode?) -> [[Int]] {
          guard let root = root else { return [] }
          
          dfs(root, row: 0, col: 0)
          
          print(sceleton)
          
          var result: [[Int]] = []
          for col in minCol...maxCol {
              let data = sceleton.filter { tuple in tuple.value.1 == col }.sorted { (l, r) in l.1.0 < r.1.0 }
              
              let level = data.map { tuple in tuple.key }
              result.append(level)
              print(data)
          }
          
          
          return result
      }
      
      private func dfs(_ root: TreeNode?, row: Int, col: Int) {
          guard let root = root else { return }
          
          minCol = min(minCol, col)
          maxCol = max(maxCol, col)
          
          sceleton[root.val] = (row, col)
          
          dfs(root.left, row: row + 1, col: col - 1)
          dfs(root.right, row: row + 1, col: col + 1)
      }
  }
}
