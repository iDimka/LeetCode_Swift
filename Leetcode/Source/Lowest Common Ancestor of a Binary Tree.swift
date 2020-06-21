//
//  Lowest Common Ancestor of a Binary Tree.swift
//  Leetcode
//
//  Created by Dzmitry Sazanovich on 6/11/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa
/*
Lowest Common Ancestor of a Binary Tree

https://leetcode.com/explore/interview/card/facebook/52/trees-and-graphs/3024/

Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.
According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”
Given the following binary tree:  root = [3,5,1,6,2,0,8,null,null,7,4]
￼

Example 1:
Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
Output: 3
Explanation: The LCA of nodes 5 and 1 is 3.
Example 2:
Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
Output: 5
Explanation: The LCA of nodes 5 and 4 is 5, since a node can be a descendant of itself according to the LCA definition.

Note:
* All of the nodes' values will be unique.
* p and q are different and both values will exist in the binary tree.
*/
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class LowestCommonAncestorofaBinaryTree {
    var answer: TreeNode?

    func lowestCommonAncestor_dfs(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let p = p, let q = q else { return nil }

        dfs(root, p, q)

        return answer
    }

    func dfs(_ root: TreeNode?, _ p: TreeNode, _ q: TreeNode) -> Bool {
        guard let root = root else { return false }

        let left = dfs(root.left, p, q) ? 1 : 0
        let right = dfs(root.right, p, q) ? 1 : 0
        let mid = (root.val == p.val || root.val == q.val) ? 1 : 0

        if (left + right + mid) > 1 {
            answer = root
        }

        return (left + right + mid) > 0
    }

  func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    print(root?.val ?? -1)
    guard let root = root else { return nil }
    guard root.val != q?.val ?? Int.min, root.val != p?.val ?? Int.min else { return root }

    let left = lowestCommonAncestor(root.left, p, q)
    if let left = left, let p = p, let q = q, left.val != p.val, left.val != q.val {
      return root
    }
    let right = lowestCommonAncestor(root.right, p, q)
    if let right = right, let p = p, let q = q, right.val != p.val, right.val != q.val {
      return root
    }

    if let _ = left, let _ = right {
      return root
    } else if let p = p, let q = q, root.val == p.val || root.val == q.val {
      return root
    } else {
      return left ?? right
    }
  }

  class func test() {
    let input: [Int?] = [1,2,3,4,5,6,7]

    let tree = input.tree()
    print(tree ?? "")
    let solution = LowestCommonAncestorofaBinaryTree()
    print(solution.lowestCommonAncestor(tree, TreeNode(2), TreeNode(5)))
  }
}

