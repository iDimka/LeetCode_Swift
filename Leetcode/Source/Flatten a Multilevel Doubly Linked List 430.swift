//
//  Flatten a Multilevel Doubly Linked List 430.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 5/17/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

class Flatten_a_Multilevel_Doubly_Linked_List_430: NSObject {
  public class Node: CustomStringConvertible {
    public var description: String {
      var descr = "\(val)"
      if let child = child {
        descr += " (\(child.val))"
      }

      return descr
    }

    public var val: Int
    public var prev: Node?
    public var next: Node?
    public var child: Node?
    public init(_ val: Int) {
      self.val = val
      self.prev = nil
      self.next = nil
      self.child  = nil
    }

    func debugDescription() -> String {
      var descr = ""
      var node: Node? = self

      while let n = node {
        descr += "\(n.val)"
        node = n.next
      }

      return descr
    }
    
  }

  func flatten(_ head: Node?) -> Node? {
    flattenThroughDFS(head)
    // print(head?.debugDescription())
    return head
  }

  private func flattenThroughDFS(_ node: Node?) {
    guard let node = node else { return }

    var queue = [node]
    var prev: Node? = nil

    while queue.isEmpty == false {
      let current = queue.removeLast();
      print(current.val)

      prev?.next = current
      current.prev = prev

      prev = current

      current.next.flatMap { queue.append($0) }
      current.child.flatMap { queue.append($0) }
      current.child = nil
    }
  }

  func flattenRecoursive(_ head: Node?) {
    guard let node = head else { return }

    flattenRecoursive(node.next)
    // print("node: \(node.val)")

    if let child = node.child {
      flattenRecoursive(child)
      let oldNext = node.next
      let (prev, _) = lastNodeFor(prew: child, last: child.next)

      node.next = child
      child.prev = node

      prev?.next = oldNext
      oldNext?.prev = prev

      node.child = nil
    }
  }
  private func lastNodeFor(prew: Node?, last: Node?) -> (Node?, Node?) {
    guard let _ = last else { return (prew, last) }

    return lastNodeFor(prew: last, last: last?.next)
  }

  class func test() {
    let n1 = Node(1)
    let n2 = Node(2)
    let n3 = Node(3)
    let n4 = Node(4)
    let n5 = Node(5)

    n1.next = n2
    n2.next = n3
    n2.child = n4
    n4.next = n5

    /*
     1  2  3
     4  5
     */

    let solution = Flatten_a_Multilevel_Doubly_Linked_List_430()
    solution.flatten(n1)
    print(n1.debugDescription())

  }
}
