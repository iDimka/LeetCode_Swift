//
//  SortStack.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 2/23/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

typealias Stack = Array

class StackSolution: NSObject {
    
    var stack = Stack<Int>()
    var tmp = Stack<Int>()
    
    func sortStack() {
        var tmpStack = Stack<Int>()
        
        while let last = stack.pop() {
            while let peacked = tmpStack.peak(), last > peacked, let tmpLast = tmpStack.popLast() {
                stack.push(tmpLast)
            }
            tmpStack.push(last)
        }
        
        while let value = tmpStack.pop() {
            stack.push(value)
        }
    }
    
    class func test() {
        let stack = StackSolution()
        
        stack.stack = [1, 5, 3, 7, 8, 9, 2]
        
        stack.sortStack()
        
        print(stack.stack)
    }
}

extension Stack {
    mutating func push(_ element: Element) {
        append(element)
    }
    
    mutating func pop() -> Element? {
        return popLast()
    }
    
    func peak() -> Element? {
        return last
    }
}
