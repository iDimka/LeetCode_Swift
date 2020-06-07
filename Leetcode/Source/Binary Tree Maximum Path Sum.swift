//
//  Binary Tree Maximum Path Sum.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 5/1/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Binary_Tree_Maximum_Path_Sum: NSObject {
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
      var maxSum = Int.min
      
      func maxPathSum(_ root: TreeNode?) -> Int {
          let _ = dfsAndMax(root)
          
          return maxSum
      }
      
      func dfsAndMax(_ root: TreeNode?) -> Int {
          guard let root = root else { return 0 }
                  
          let leftSum = max(dfsAndMax(root.left), 0)
          let rightSum = max(dfsAndMax(root.right), 0)
          let result = leftSum + rightSum + root.val
          
          maxSum = max(maxSum, result, root.val)
          
          return max(leftSum, rightSum) + root.val
      }
  }
}
