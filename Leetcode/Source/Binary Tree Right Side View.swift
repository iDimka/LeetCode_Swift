//
//  Binary Tree Right Side View.swift
//  Leetcode
//
//  Created by Dzmitry Sazanovich on 6/7/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa
/*
 https://leetcode.com/explore/interview/card/facebook/52/trees-and-graphs/3023/

 Given a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

 Example:

 Input: [1,2,3,null,5,null,4]
 Output: [1, 3, 4]
 Explanation:

    1            <---
  /   \
 2     3         <---
  \     \
   5     4       <---
 */
class Binary_Tree_Right_Side_View: NSObject {
  func rightSideView(_ root: TreeNode?) -> [Int] {
        var rightSideArray = [Int]()
        dfs(root, level: 0, rightSide: &rightSideArray)
        return rightSideArray
    }

    private func dfs(_ node: TreeNode?, level: Int, rightSide: inout [Int]) {
        guard let node = node else { return }

        if level == rightSide.count {
            rightSide.append(node.val)
        }

        node.right.flatMap { dfs($0, level: level + 1, rightSide: &rightSide) }
        node.left.flatMap { dfs($0, level: level + 1, rightSide: &rightSide) }
    }
}
