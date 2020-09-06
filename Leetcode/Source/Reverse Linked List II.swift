//
//  Reverse Linked List II.swift
//  Leetcode
//
//  Created by Dzmitry Sazanovich on 8/31/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

/** https://leetcode.com/problems/reverse-linked-list-ii/
 Reverse a linked list from position m to n. Do it in one-pass.

 Note: 1 ≤ m ≤ n ≤ length of list.

 Example:

 Input: 1->2->3->4->5->NULL, m = 2, n = 4
 Output: 1->4->3->2->5->NULL
 */
class Reverse_Linked_List_II: NSObject {
  /**
   * Definition for singly-linked list.
   * public class ListNode {
   *     public var val: Int
   *     public var next: ListNode?
   *     public init() { self.val = 0; self.next = nil; }
   *     public init(_ val: Int) { self.val = val; self.next = nil; }
   *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
   * }
   */
  class Solution {
    func reverseBetweenRecursive(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
          func reverse(_ head: ListNode?, count: Int) -> (ListNode?, ListNode?) {
              guard let node = head, let next = node.next, count > 0 else {
                  return (head, head?.next)
              }

              let newHead = reverse(next, count: count - 1)

              node.next?.next = node
              node.next = nil

              return newHead
          }

           guard let head = head else { return nil }

           var start: ListNode? = head
           var count = m
           var preStart: ListNode?
           while count > 1 {
               preStart = start
               start = start?.next
               count -= 1
           }

           print("Start: \(start?.val ?? -1)")

           let (newHead, next) = reverse(start, count: n - m)

           preStart?.next = newHead
           start?.next = next

           print(next?.val)

           return m == 1 ? newHead : head
       }

      func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
          guard let head = head else { return nil }

          var start: ListNode? = head
          var count = m
          var headOfInner: ListNode?
          while count > 1 {
              headOfInner = start
              start = start?.next
              count -= 1
          }

          print("Start: \(start?.val ?? -1)")

          let tail = start?.next
          var prev: ListNode?
          var curr: ListNode? = start
          count = n - m
          while count >= 0 { // 012345
              print("-curr: \(curr?.val ?? -1) count: \(count)")

              let next = curr?.next // 1 // 2
              curr?.next = prev // nil // 1
              prev = curr // 0 // 1
              curr = next // 1 // 2

              count -= 1
          }

          print("start: \(start?.val ?? -1) curr: \(curr?.val ?? -1) tail: \(tail?.val ?? -1) prev: \(prev?.val ?? -1), headOfInner: \(headOfInner?.val ?? -1)")

          headOfInner?.next = prev
          start?.next = curr


          return m == 1 ? prev : head
      }
  }
}
