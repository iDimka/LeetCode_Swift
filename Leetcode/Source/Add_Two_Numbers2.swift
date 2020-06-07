//
//  Add Two Numbers.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 2/23/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Add_Two_Numbers2: NSObject {
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    class func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var result: ListNode?
        var carry = 0
        var l1 = l1
        var l2 = l2
        var lastNodeInResult: ListNode?
        
        while let first = l1, let second = l2 {
            
            let sum = first.val + second.val + carry
            let node = ListNode(sum.remainderReportingOverflow(dividingBy: 10).partialValue)
            
            print("\(first.val), \(second.val) \(sum)")
            
            if result == nil {
                result = node
            } else {
                lastNodeInResult?.next = node
            }
            
            lastNodeInResult = node
            
            carry = sum / 10
            
            l1 = l1?.next
            l2 = l2?.next
        }
        
        var restOfLists = l1 != nil ? l1 : l2
        
        while let first = restOfLists {
            let sum = first.val + carry
            let reminder = sum.remainderReportingOverflow(dividingBy: 10).partialValue
            lastNodeInResult?.next = ListNode(reminder)
            lastNodeInResult = lastNodeInResult?.next
            
            print("\(first.val), rem: \(reminder), carry: \(carry), \(sum)")
            
            carry = sum / 10
            restOfLists = first.next
        }
        
        print("Carry \(carry)")
        
        if carry != 0 {
            lastNodeInResult?.next = ListNode(1)
        }
        
        return result
    }
    
    class func test() {
        let l1 = ListNode(7)
        let l2 = ListNode(7)
        
        let l3 = addTwoNumbers(l1, l2)
        
        print(l3)
    }
}
