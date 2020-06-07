//
//  Same Tree.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 4/4/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Same_Tree: NSObject {
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
  func isSameTreeRequrcive(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil, q == nil {
      return true
    }
    
    guard let p = p, let q = q, p.val == q.val else { return false }
    
    return isSameTreeRequrcive(p.left, q.left) && isSameTreeRequrcive(p.right, q.right)
  }
  
  func isTheSame(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil, q == nil {
      return true
    }
    if let p = p, let q = q, p.val == q.val {
      return true
    }
    
    return false
  }
  
  func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    guard isTheSame(p, q) else { return false }
    guard let left = p, let right = q else { return q == nil && p == nil }
    
    var leftQueue = [left]
    var rightQueue = [right]
    
    while let left = leftQueue.popLast(), let right = rightQueue.popLast() {
      print("\(left.val)_\(right.val)")
      guard isTheSame(left, right) else { return false }
      
      guard isTheSame(left.left, right.left) else { return false }
      guard isTheSame(left.right, right.right) else { return false }
      
      if let leftLeft = left.left, let rightLeft = right.left {
        leftQueue.append(leftLeft)
        rightQueue.append(rightLeft)
      }
      
      if let leftRight = left.right, let rightRight = right.right {
        leftQueue.append(leftRight)
        rightQueue.append(rightRight)
      }
    }
    
    return true
  }
}
