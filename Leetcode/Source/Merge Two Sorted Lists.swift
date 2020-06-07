//
//  Merge Two Sorted Lists.swift
//  LeetCodeMedium
//
//  Created by Dim Sazanovich on 1/12/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Foundation

//public class ListNode {
//    public var val: Int
//    public var next: ListNode?
//    public init(_ val: Int) {
//        self.val = val
//        self.next = nil
//    }
//}
//
//extension Optional: Equatable where Wrapped == ListNode {
//    public static func == (lhs: ListNode?, rhs: ListNode?) -> Bool {
//        guard let left = l, let right = r else { return true }
//
//        return left.val == right.val
//    }
//}

class MergeLinkedListSolution {
    class func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else { return l2 }
        guard let l2 = l2 else { return l1 }
        
        if l1 > l2 {
            l2.next = mergeTwoLists(l1, l2.next)
            return l2
        } else {
            l1.next = mergeTwoLists(l1.next, l2)
            return l1
        }
    }
    
    class func test() {
        let head1 = ListNode(0, next: ListNode(2, next: ListNode(7, next: nil)))
        let head2 = ListNode(1, next: ListNode(3, next: ListNode(4, next: nil)))
        print("Result is ")
        print(mergeTwoLists(head1, head2)!)
    }
}
