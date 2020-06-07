//
//  Binary Tree Level Order Traversal.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 4/5/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Binary_Tree_Level_Order_Traversal: NSObject {
  func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [] }
    
    var queue: [[TreeNode]] = [[root]]
    var result: [[Int]] = []
    
    while let layer = queue.popLast() {
      result += [layer.map { $0.val }]
      let newLayer = layer.map { [$0.left, $0.right].compactMap { $0 } }.flatMap { $0 }
      if newLayer.isEmpty == false {
        queue += [newLayer]
      }
    }
    
    return result
  }
  
  func levelOrderRecursive(_ root: TreeNode?) -> [[Int]] {
    func traverse(_ node: TreeNode?, level: Int, cache: inout [[Int]]) {
      guard let node = node else { return }
      if cache.count == level {
        cache.append([])
      }
      
      cache[level].append(node.val)
      
      if let left = node.left {
        traverse(left, level: level + 1, cache: &cache)
      }
      if let right = node.right {
        traverse(right, level: level + 1, cache: &cache)
      }
    }
    var result: [[Int]] = []
    traverse(root, level: 0, cache: &result)
    return result
  }
}
