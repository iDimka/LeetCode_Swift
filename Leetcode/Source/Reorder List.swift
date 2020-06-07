//
//  Reorder List.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 6/3/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

/*
 Given a singly linked list L: L0→L1→…→Ln-1→Ln,
 reorder it to: L0→Ln→L1→Ln-1→L2→Ln-2→…

 You may not modify the values in the list's nodes, only nodes itself may be changed.

 Example 1:

 Given 1->2->3->4, reorder it to 1->4->2->3.
 Example 2:

 Given 1->2->3->4->5, reorder it to 1->5->2->4->3.
 */

class Reorder_List: NSObject {
  public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
  }

  func reorderList(_ head: ListNode?) {
    var slowNode = head
    var fastNode = head

    while fastNode?.next != nil {
      slowNode = slowNode?.next
      fastNode = fastNode?.next?.next
    }

    // print("slow: \(slowNode?.val) fast: \(fastNode?.val)")
    // 1 [2 3]
    var prev: ListNode?
    var current = slowNode
    var next: ListNode?
    while current != nil {
      next = current?.next
      current?.next = prev
      prev = current
      current = next
    }

    // print("reverted head: \(prev?.val)")

    var firstNode: ListNode? = head
    var secondNode: ListNode? = prev
    while let _ = secondNode?.next {
      var tmp = firstNode?.next
      firstNode?.next = secondNode
      firstNode = tmp

      tmp = secondNode?.next
      secondNode?.next = firstNode
      secondNode = tmp
    }
  }
}
