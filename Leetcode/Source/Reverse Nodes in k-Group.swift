//
//  Reverse Nodes in k-Group.swift
//  Leetcode
//
//  Created by Dzmitry Sazanovich on 8/29/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

class Reverse_Nodes_in_k_Group: NSObject {
  func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
      guard let head = head else { return nil }

      let size = sizeOf(of: head)
    var prevTail: ListNode?
      for index in 0..<size / k {
          var startIndex = index * k
          var startNode: ListNode? = head

          print("flip from: \(startIndex)")
          while startIndex > 0 {
              startNode = startNode?.next
            startIndex -= 1
          }
        let tail = flipNext(k, from: startNode)
        print("tail: \(tail?.val)")
      }

      return head
  }

  func flipNext(_ k: Int, from head: ListNode?) -> ListNode? {
      guard let node = head, let _ = node.next, k > 0 else { return head }

      let flipped = flipNext(k - 1, from: node.next)
      node.next?.next = node
      node.next = nil

      print("node: \(node.val) flipped: \(flipped?.val)")

      return node
  }

  func sizeOf(of list: ListNode?) -> Int {
      guard let node = list else { return 0 }

      return sizeOf(of: node.next) + 1
  }

  class func test() {
    let solution = Reverse_Nodes_in_k_Group()
    let input = ListNode(0, next: ListNode(1, next: ListNode(2, next: ListNode(3, next: ListNode(4, next: ListNode(5, next: nil))))))

    let result = solution.reverseKGroup(input, 2)

    print(result)
  }
}
