//
//  Copy List with Random Pointer.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 4/12/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Copy_List_with_Random_Pointer: NSObject {
  public class Node: Hashable {
    public static func == (lhs: Copy_List_with_Random_Pointer.Node, rhs: Copy_List_with_Random_Pointer.Node) -> Bool {
      return lhs.val == rhs.val
    }
    
    var hashValue: Int { val }
    
    public var val: Int
    public var next: Node?
    public var random: Node?
    public init(_ val: Int) {
      self.val = val
      self.next = nil
      self.random = nil
    }
  }
  
  var cache: [Node: Node] = [:]
  
  func copyRandomList(_ head: Node?) -> Node? {
    guard let head = head else { return nil }
    guard cache[head] == nil else { return cache[head] }
    
    let newNode = Node(head.val)
    cache[head] = newNode
    
    if let oldRandNode = head.random {
      let randNode = copyRandomList(head.random)
      newNode.random = randNode
      cache[oldRandNode] = randNode
    }
    
    if let oldNextNode = head.next {
      let nextNode = copyRandomList(head.next)
      newNode.next = nextNode
      cache[oldNextNode] = nextNode
    }
    
    return newNode
  }
}
