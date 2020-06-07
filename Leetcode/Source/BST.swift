//
//  BST.swift
//  LeetCodeMedium
//
//  Created by Dmitry Sazanovich on 1/8/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Foundation

class Vertex<T> {
    let key: T
    let neighbors: [Vertex]
    
    init(key: T, neighbors: [Vertex]) {
        self.key = key
        self.neighbors = neighbors
    }
}

typealias Queue = Array

extension Queue {
    mutating func popFromQueue() -> Element {
        return removeFirst()
    }
    
    mutating func pushToQueue(_ element: Element) {
        insert(element, at: 0)
    }
}

enum BinaryTree<T: Comparable> : CustomStringConvertible {
    case empty
    indirect case node(BinaryTree, T, BinaryTree)
    
    var description: String {
        switch self {
        case let .node(left, value, right): return "value: \(value), left = [" + left.description + "], right = [" + right.description + "]"
        case .empty: return ""
        }
    }
    
    var value: T? {
        switch self {
        case .node(_, let value, _):
            return value
        case .empty:
            return nil
        }
    }
    
    var count: Int {
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }
    
    private func node(with newValue: T) -> BinaryTree {
        let node: BinaryTree
        
        switch self {
        case .node(let left, let value, let right):
            if newValue > value {
                node = .node(left, value, right.node(with: newValue))
            } else {
                node = .node(left.node(with: newValue), value, right)
            }
        case .empty:
            node = .node(.empty, newValue, .empty)
        }
        
        return node
    }
    
    
    mutating func insert(newValue: T) {
       self = node(with: newValue)
    }
    
    func traverseInOrder(process: (T)->Void) {
        switch self {
        case .empty:
            break
        case let .node(left, value, right):
            left.traverseInOrder(process: process)
            process(value)
            right.traverseInOrder(process: process)
        }
    }
    
    func maxHeight() -> Int {
        guard case .node(let left, _, let right) = self else { return 0 }
        
        return max(left.maxHeight(), right.maxHeight()) + 1
    }
    
    func minHeight() -> Int {
        guard case .node(let left, _, let right) = self else { return 0 }
        
        return min(left.minHeight(), right.minHeight()) + 1
    }
  
  func maxWidth() -> Int {
    func maxWidth(_ root: BinaryTree, level: Int) -> Int {
      guard case let .node(left, _, right) = root else { return 0 }
      guard level > 1 else { return 1 }
      
      return maxWidth(left, level: level - 1) + maxWidth(right, level: level - 1)
      
    }
    var maxW = 0
    for ind in 1..<self.maxHeight() {
      maxW = max(maxW, maxWidth(self, level: ind))
    }
    
    return maxW
  }
    
    func bfs(value: T, /*visited: inout [BinaryTree], processed: inout [BinaryTree],*/ completion: @escaping (BinaryTree) -> Void) {
        var queue = Queue<BinaryTree>([self])
        var visited: [BinaryTree<T>] = []
        
        while queue.isEmpty == false {
            let node = queue.popFromQueue()
            
            switch node {
            case let .node(left, innerValue, right):
                guard visited.contains(where: { $0.value == node.value }) == false else { return }
                guard value != innerValue else { return completion(node) }
                
                queue.pushToQueue(right)
                queue.pushToQueue(left)
                
                visited += [node]
            default:
                break
            }
        }
        
        
//        while visited.contains(where: { $0.value == self.value }) == false, case .node(let left, let innerValue, let right) = self {
//            if value == innerValue {
//                return completion(self)
//            }
//
//            visited += [self]
//            left.bfs(value: value, visited: &visited, processed: &processed, completion: completion)
//            right.bfs(value: value, visited: &visited, processed: &processed, completion: completion)
//            processed += [self]
//        }
    }
}



  func testBST() {
   var tree: BinaryTree<Int> = .empty
    tree.insert(newValue: 7)
    tree.insert(newValue: 10)
    tree.insert(newValue: 2)
    tree.insert(newValue: 1)
    tree.insert(newValue: 5)
    tree.insert(newValue: 9)

    var visited: [BinaryTree<Int>] = []
    var processed: [BinaryTree<Int>] = []
    
    tree.bfs(value: 1, /*visited: &visited, processed: &processed,*/ completion: { value in
        print(value)
    })
  
    
    tree.traverseInOrder { print($0) }
    print(tree.description)
    print(tree.maxHeight())
    print(tree.minHeight())
    print("max width: \(tree.maxWidth())")
}
