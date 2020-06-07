//
//  Validate Binary Search Tree.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 4/13/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Validate_Binary_Search_Tree: NSObject {
  
  func isValidBSTRecursive(_ root: TreeNode?, min: Int? = nil, max: Int? = nil) -> Bool {
    guard let root = root else { return true }
    
    if let min = min, root.val <= min {
      return false
    }
    if let max = max, root.val >= max {
      return false
    }
    
    return
      isValidBSTRecursive(root.left, min: min, max: root.val)
        &&
      isValidBSTRecursive(root.right, min: root.val, max: max)
  }
  
  // Uses inorder traversal because each next node should have a bigger value. If not the tree is not valid.
  func isValidBST(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }
    
    var stack: [TreeNode] = []
    var node: TreeNode? = root
    var compareValue = Int.min
    
    while node != nil || stack.isEmpty == false {
      while let n = node {
        stack.append(n)
        node = n.left
      }
      
      guard stack.isEmpty == false else {
        return false //???
      }
      
      let n = stack.removeLast()
      
      guard n.val > compareValue else {
        return false
      }
      compareValue = n.val
      node = n.right
    }
    return true
  }
  
  class func test() {
    let input: [Int?] = [1,2,3,4,5,6,7]
    
    let tree = input.tree()
    print(tree ?? "")
    
    TreeNode.DFSIteractive(tree!, visit: { print($0) })    
    
    print(Validate_Binary_Search_Tree().isValidBSTRecursive(tree))
  }
}

extension Array where Element == Int? {
  func tree(from index: Int = 0) -> TreeNode? {
    guard isEmpty == false else { return nil }
    guard index < count else { return nil }
    guard let value = self[index] else { return nil }
    
    return TreeNode(value,
                    left: tree(from: index * 2 + 1),
                    right: tree(from: index * 2 + 2))
    
  }
}
