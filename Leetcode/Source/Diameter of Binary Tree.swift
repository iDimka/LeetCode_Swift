//
//  Diameter of Binary Tree.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 2/26/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Diameter_of_Binary_Tree: NSObject {
    public class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init(_ val: Int) {
            self.val = val
        }
    }
    
    var result = 0
    
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        let _ = depth(root)
        
        return result - 1
    }
    
    func depth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        let maxLeft = depth(root.left)
        let maxRight = depth(root.right)
        
        result = max(result, maxLeft + maxRight + 1)
        
        return max(maxLeft, maxRight) + 1
    }
    
    class func test() {
        let tree = TreeNode(1)
        let solution = Diameter_of_Binary_Tree()
        
        print(solution.diameterOfBinaryTree(tree))
        
        tree.left = TreeNode(2)
        tree.right = TreeNode(3)
        
        print(solution.diameterOfBinaryTree(tree))
    }
}
