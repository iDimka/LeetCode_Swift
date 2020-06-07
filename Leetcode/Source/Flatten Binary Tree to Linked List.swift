//
//  Flatten Binary Tree to Linked List.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 4/29/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Flatten_Binary_Tree_to_Linked_List: NSObject {
  func flatten(_ root: TreeNode?) {
    let _ = _flatten(root)
  }
  
  func _flatten(_ node: TreeNode?) -> TreeNode? {
    guard let node = node else {
      return nil
    }
    guard node.left != nil && node.right != nil else { 
      return node
    }
    
    let leftTail = _flatten(node.left)
    let rightTail = _flatten(node.right)
    // If there was a left subtree, we shuffle the connections
    // around so that there is nothing on the left side
    // anymore.
    if let leftTail = leftTail {
      leftTail.right = node.right
      node.right = node.left
      node.left = nil
    }
    // We need to return the "rightmost" node after we are
    // done wiring the new connections.
    return rightTail ?? leftTail
  }
  
  class func test() {
    let solution = Flatten_Binary_Tree_to_Linked_List()
    let input: [Int?] = [1,2,3,4,5,6,7]
    let tree = input.tree()
    print("Before: \(tree!)")
    solution.flatten(tree)
    print("After: \(tree!)")
  }
}
