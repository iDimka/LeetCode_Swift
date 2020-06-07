//
//  MaximumDepthOfBinaryTree .swift
//  LeetCodeMedium
//
//  Created by Dmitry Sazanovich on 1/8/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Foundation

class SolutionMaximumDepthOfBinaryTree {
  
  class func numberNodes(_ root: TreeNode?, depth: Int = 0) -> Int {
    guard let root = root else { return 1 }
    
    return numberNodes(root.left) + numberNodes(root.right)
  }
  
  class func maxDepth(_ root: TreeNode?, depth: Int = 0) -> Int {
    guard let root = root else { return depth }
    
    print(root.val)
    
    let depth = maxDepth(root.left, depth: depth + 1)
    
    let rightDepth = maxDepth(root.right, depth: depth + 1)
    
    return rightDepth
  }
  
  class func test() {
    //         1
    //     2       3
    // 21      4
    //             5
    //         55
    let root = TreeNode(
      1,
      left: TreeNode(2,
                     left: nil,//TreeNode(21, left: nil, right: nil),
        right: TreeNode(4,
                        left: nil,
                        right: TreeNode(5,
                                        left: TreeNode(55, left: nil, right: nil),
                                        right: nil))
      ),
      right: nil//TreeNode(3, left: nil, right: nil)
    )
    print("Root:\n\(root)")
    print("Nodes count is \(numberNodes(root))")
    print("\nDepth is \(maxDepth(root))")
    print("Search 5: \(root.search(value: 5))")
  }
}
