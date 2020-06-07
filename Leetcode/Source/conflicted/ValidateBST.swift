//
//  ValidateBST.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 3/21/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Foundation

final class ValidateBST2<T: Comparable> {
 public class TreeNode {
      public var value: Int
      public var left: TreeNode?
      public var right: TreeNode?
      public init(_ val: Int) {
          self.value = val
          self.left = nil
          self.right = nil
      }
  }

  func isValidBST_TobBottom(_ root: TreeNode?) -> Bool {
      guard let root = root else { return true }
      if let left = root.left, left.value >= root.value {
          return false
      }
      if let right = root.right, right.value <= root.value {
          return false
      }

      return isValidBST_TobBottom(root.left) && isValidBST_TobBottom(root.right)
  }

  func isValidBST_BottomTop(root: TreeNode) -> Bool {
    var stack:[TreeNode] = [root]

    while stack.isEmpty == false {
      let parent = stack.removeFirst()

      if let left = parent.left, left.value >= parent.value {
        return false
      }
      if let right = parent.right, right.value <= parent.value {
        return false
      }

      if let left = parent.left {
        stack.append(left)
      }
      if let right = parent.right {
        stack.append(right)
      }
    }
    return true
  }
}
