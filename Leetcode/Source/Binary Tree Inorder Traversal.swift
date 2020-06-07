//
//  Binary Tree Inorder Traversal.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 4/4/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Binary_Tree_Inorder_Traversal: NSObject {
  public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
      self.val = val
      self.left = nil
      self.right = nil
    }
  }
  
  func inorderTraversalRecursive(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    
    var cache: [Int] = []
    traversal(root, &cache)
    
    return cache
  }
  
  func traversal(_ root: TreeNode?, _ cache: inout [Int]) {
    guard let root = root else { return }
    
    traversal(root.left, &cache)
    cache.append(root.val)
    traversal(root.right, &cache)
  }
  
  func inorderTraversalIteratively(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    
    var result: [Int] = []
    var stack: [TreeNode] = []
    var current: TreeNode? = root
    
    while current != nil || stack.isEmpty == false {
      if let node = current {
        stack.append(node)
        current = node.left
      } else if let node = stack.popLast() {
        result.append(node.val)
        current = node.right
      }
    }
    
    return result
  }
}
