//
//  Merge Intervals.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 3/10/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Merge_Intervals {
    class func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard let arr1 = intervals.first, let first1 = arr1.first, let last1 = arr1.last else { return intervals }
        guard intervals.count > 1 else { return intervals }
        
        let intervals = intervals.sorted { (arr1, arr2) in
            return arr1.first! < arr2.first!
        }
        var result: [[Int]] = []
        
        var firstIndex = 0
        var secondIndex = 1
        var lastLast = intervals[1].last!
        var firstFirst: Int?
        
        while firstIndex < intervals.count, secondIndex < intervals.count {
            let arr1 = intervals[firstIndex]
            let arr2 = intervals[secondIndex]
            
            let first1 = arr1.first!
            let last1 = arr1.last!
            let first2 = arr2.first!
            let last2 = arr2.last!
            
            if first2 <= lastLast {
                firstFirst = min(first1, firstFirst ?? first1)
                lastLast = last2
                secondIndex += 1
            } else if let first = firstFirst {
                let last = lastLast
                
                result.append([first, last])
                
                firstIndex = secondIndex + 1
                secondIndex += 2
                firstFirst = first2
                lastLast = last2
            }
        }
        
        if firstIndex < intervals.count, secondIndex >= intervals.count, let last = intervals.last {
            result.append(last)
            print("tail: \(last)")
        }
        
        let last = lastLast
        if let first = firstFirst {
            result.append([first, last])
        }
        
        
        return result
    }
    
    class func merge2(_ intervals: [[Int]]) -> [[Int]] {
        let intervals = intervals.sorted(by: { $0.start < $1.start })
        guard intervals.count > 1, let firstInterval = intervals.first else { return intervals }
        
        var result: [[Int]] = [firstInterval]
        
        for interval in intervals[1..<intervals.count] {
            guard let previous = result.last else { continue }
            
            if previous.end >= interval.start {
                result.removeLast()
                result.append([previous.start, max(interval.end, previous.end)])
            } else {
                result.append(interval)
            }
        }
        
        return result
    }
    
    class func test() {
        let input = [[1,4],[0,4]]
        
        print(merge2(input))
    }
}

extension Array {
    var start: Element { first! }
    var end: Element { last! }
}
