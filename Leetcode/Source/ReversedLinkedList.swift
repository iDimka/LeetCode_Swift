/**
  1<-2 3->4->5
  Definition for singly-linked list.
 */
public class ListNode: CustomStringConvertible, Equatable, Comparable {
    public static func < (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val < rhs.val
    }
    
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val
    }
    
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int, next: ListNode?) {
        self.val = val
        self.next = next
    }
    
    public var description: String {
        var value: String = "\(val)"
        var node = next
        
        while let next = node {
            value += "->\(next.val)"
            node = next.next
        }
        
        return value
    }
}

class SolutionReversedLinkedList {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var node = head
        var next = head?.next
        var nextNext = next?.next
        var previous: ListNode?
        
        while let _ = node {
            next?.next = node
            node?.next = previous
            
            previous = node
            node = next
            next = nextNext
            nextNext = next?.next
        }
        
        return previous
    }
    
    func reverseListRecursive(_ head: ListNode?) -> ListNode? {
        return recurse(prev: nil, current: head, next: head?.next)
    }
    /// nil 1 2 3 4 5
    func recurse(prev: ListNode?, current: ListNode?, next: ListNode?) -> ListNode? {
        guard let _ = next else { current?.next = prev; return current }
        
        let nextNext = next?.next
        next?.next = current
        current?.next = prev
        
        if let nextNext = nextNext {
            return recurse(prev: next, current: nextNext, next: nextNext.next)
        } else {
            return next
        }
    }
    
    func recursiveShort(_ head: ListNode?) -> ListNode? {
        guard let _ = head?.next else { return head }
        
        let last = recursiveShort(head?.next)
        // head = 4.next = 5.nil
        // last = 5.next = nil
        
        head?.next?.next = head
        head?.next = nil
        
        return last
    }
    
    class func test() {
        let head = ListNode(1, next: ListNode(2, next: ListNode(3, next: ListNode(4, next: ListNode(5, next: nil)))))
        
        print("Input: \(head)")
        
        let result = SolutionReversedLinkedList().reverseList(head)
        
        print("Output: \(result!)")
    }
    
    class func testRecursive() {
        let head = ListNode(1, next: ListNode(2, next: ListNode(3, next: ListNode(4, next: ListNode(5, next: nil)))))
        
        print("Input:  \(head)")
        
        let result = SolutionReversedLinkedList().reverseListRecursive(head)
        
        print("Output: \(result!)")
    }
    
    class func testRecursiveShort() {
        let head = ListNode(1, next: ListNode(2, next: ListNode(3, next: ListNode(4, next: ListNode(5, next: nil)))))
        
        print("Input:  \(head)")
        
        let result = SolutionReversedLinkedList().recursiveShort(head)
        
        print("Output: \(result!)")
    }
}

