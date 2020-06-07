//
//  Add Two Numbers.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 5/24/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa
/*
https://leetcode.com/explore/interview/card/facebook/6/linked-list/319/

 Add Two Numbers
 Solution
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.

 Example:

 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807.
 */
class Add_Two_Numbers: NSObject {
  public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
  }

  func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
      guard let l1 = l1 else { return l2 }
      guard let l2 = l2 else { return l1 }

      var left: ListNode? = l1
      var right: ListNode? = l2
      var carry = 0

      let dummyNode = ListNode(-1)
      var current = dummyNode

      while left != nil || right != nil {
          let leftNum = left?.val ?? 0
          let rightNum = right?.val ?? 0
          let (quotient, remainder) = (leftNum + rightNum + carry).quotientAndRemainder(dividingBy: 10)
          let newNode = ListNode(remainder)
          carry = quotient
          current.next = newNode

          current = newNode
          left = left?.next
          right = right?.next
      }

      if carry > 0 {
          current.next = ListNode(carry)
      }

      return dummyNode.next
  }
}
