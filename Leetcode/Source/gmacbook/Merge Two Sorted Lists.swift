//
//  Merge Two Sorted Lists.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 5/25/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa
/**
 https://leetcode.com/explore/interview/card/facebook/6/linked-list/301/

 Merge Two Sorted Lists
 Solution
 Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.

 Example:

 Input: 1->2->4, 1->3->4
 Output: 1->1->2->3->4->4
 */
class Merge_Two_Sorted_Lists: NSObject {
   public class ListNode {
       public var val: Int
       public var next: ListNode?
       public init() { self.val = 0; self.next = nil; }
       public init(_ val: Int) { self.val = val; self.next = nil; }
       public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
   }

  func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
      let dummyNode = ListNode(-1)
      merge(l1, l2, result: dummyNode)
      return dummyNode.next
  }

  private func merge(_ l1: ListNode?, _ l2: ListNode?, result: ListNode) {
      guard let l1 = l1 else { return result.next = l2 }
      guard let l2 = l2 else { return result.next = l1 }

      if l1.val > l2.val {
          let newNode = ListNode(l2.val)
          result.next = newNode
          merge(l1, l2.next, result: newNode)
      } else {
          let newNode = ListNode(l1.val)
          result.next = newNode
          merge(l1.next, l2, result:newNode)
      }
  }
}
