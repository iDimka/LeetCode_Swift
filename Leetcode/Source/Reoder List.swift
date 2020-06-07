//
//  Reoder List.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 4/12/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Reoder_List: NSObject {
  public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
      self.val = val
      self.next = nil
    }
    
    var array: [ListNode] {
      var node: ListNode? = self
      var result: [ListNode] = []
      
      while let n = node {
        result.append(n)
        node = n.next
      }
      
      return result
    }
    
    func description() -> String {
      var node: ListNode? = self
      var desc = ""
      
      while let n = node {
        desc += "\(n.val)->"
        node = n.next
      }
      
      return desc
    }
  }
  
  var start: ListNode?
  var count = 0
  
  
  func reorderList2(_ head: ListNode?) {
    guard let head = head else { return }
    var array = head.array
    
    var current: ListNode? = head
    
    while array.count > 1 {
      let last = array.removeLast()
      let first = array.removeFirst()
      
      let nextNext = first.next
      first.next = last
      first.next?.next = nextNext
      
      current = last
    }
    
    if array.isEmpty == false {
      current?.next = array.removeLast()
      current?.next?.next = nil
    } else {
      current?.next = nil
    }
  }
  
  func reorderListRecursive(_ head: ListNode?) {
    func reorder(_ head: ListNode?, index: Int) {
      guard let head = head else { print("base case"); return }
      
      reorder(head.next, index: index + 1)
      
      count = max(count, index)
      
      if (index - count.remainderReportingOverflow(dividingBy: 2).partialValue) == (count) / 2 {
        head.next = nil
      }
      if index < (count + 1) / 2 {
        return
      }
      
      if let next = start?.next {
        start?.next = head
        start?.next?.next = next
        start = next
      }
    }
    start = head
    
    reorder(head, index: 0)
  }
  class func testLinkedList() -> ListNode {
    let nodes: [ListNode] = [1,2,3,4].map { ListNode($0) }
    
    for (ind, _) in nodes.enumerated() {
      guard ind != nodes.count - 1 else { continue }
      let node = nodes[ind]
      let nextNode = nodes[ind + 1]
      
      node.next = nextNode
    }
    
    return nodes[0]
  }
  
  class func test() {
    let input = testLinkedList()
    
    let solution = Reoder_List()
    solution.reorderListRecursive(input)
    
    print(input.description())
  }
}
