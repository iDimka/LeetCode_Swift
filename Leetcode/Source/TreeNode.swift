//
//  TreeNode.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 4/13/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

public class TreeNode: CustomStringConvertible {
  enum TraverseOrder {
    case preorder, inorder, postorder
  }
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init(_ val: Int, left: TreeNode? = nil, right: TreeNode? = nil) {
    self.val = val
    self.left = left
    self.right = right
  }
  
  class func tree(from array: [Int]) -> TreeNode? {
    func tree(array: [Int?], index: Int = 0) -> TreeNode? {
      guard array.isEmpty == false else { return nil }
      guard index < array.count else { return nil }
      guard let value = array[index] else { return nil }
      
      return TreeNode(value,
                      left: tree(array: array, index: index * 2 + 1),
                      right: tree(array: array, index: index * 2 + 2))
    }
    
    return tree(array: array, index: 0)
  }
  
  func BFS(_ root: TreeNode?) {
    guard let root = root else { return }
    
    var stack: [TreeNode] = [root]
    
    while stack.isEmpty == false {
      let node = stack.removeFirst()
      
      node.left.flatMap { stack.append($0) }
      node.right.flatMap { stack.append($0) }
      
      print(node.val)
    }
  }
  
  class func BFSIteractive(_ root: TreeNode?, visit: (TreeNode)->Void) {
    guard let root = root else { return }
    
    var stack: [TreeNode] = [root]
    
    while stack.isEmpty == false {
      let node = stack.removeFirst()
      
      visit(node)
      
      node.left.flatMap { stack.append($0) }
      node.right.flatMap { stack.append($0) }
    }
  }
  
  class func DFSIteractive(_ root: TreeNode, visit: (TreeNode)->Void) {
    var stack: [TreeNode] = []
    var current: TreeNode? = root
    
    while current != nil || stack.isEmpty == false {
      while let node = current {
        stack.append(node)
        current = node.left
      }
      
      guard stack.isEmpty == false else { continue }
      
      let node = stack.removeLast()
      visit(node)
      current = node.right
    }
  }
  
  func search(value: Int) -> TreeNode? {
    if val == value {
      return self
    }
    
    if let result = left?.search(value: value) {
      return result
    }
    
    if let result = right?.search(value: value) {
      return result
    }
    
    return nil
  }
  
  public var description: String {
    var text: String = "\(val)"
    let l = (left?.description ?? "-")
    let r = (right?.description ?? "-")
    
    if left != nil || right != nil {
      text += " {" + l + ", " + r + "} "
    }
    return text
  }
}
