//
//  3Sum Closest.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 2/14/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class _Sum_Closest: NSObject {
//    class func _threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
//        var minDiff = Int.max
//        
//        let count = nums.count
//        (0..<count).forEach { (firstIndex) in
//            (firstIndex+1..<count).forEach { (secondIndex) in
//                (secondIndex+1..<count).forEach { (thirdIndex) in
//                    
//                    let first = nums[nums.index(nums.startIndex, offsetBy: firstIndex)]
//                    let second = nums[nums.index(nums.startIndex, offsetBy: secondIndex)]
//                    let third = nums[nums.index(nums.startIndex, offsetBy: thirdIndex)]
//                    
//                    let sum = first + second + third
//                    let maxValue = max(target, sum)
//                    
//                    minDiff = min(maxValue, minDiff)
//                }
//            }
//        }
//        
//        return minDiff
//    }
    
    class func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var minDiffSum = Int.max / 2
        let sortedNums = nums.sorted()
        print("Sorted: \(sortedNums)\n")
        
        for index in 0..<(nums.count - 1) {
            var nextIndex = index + 1
            var lastIndex = nums.count - 1
            var tmpSum = 0
            
            while nextIndex != lastIndex {
                let first = sortedNums[nums.index(sortedNums.startIndex, offsetBy: index)]
                let next = sortedNums[sortedNums.index(sortedNums.startIndex, offsetBy: nextIndex)]
                let last = sortedNums[sortedNums.index(sortedNums.startIndex, offsetBy: lastIndex)]
                
                let sum = first + next + last
                // 0 1 2 3 4 5
                if sum - target == 0 {
                    return sum
                } else if sum > target {
                    lastIndex -= 1
                } else if sum < target {
                    nextIndex += 1
                }
                
                tmpSum = first + next + last
                
                minDiffSum = abs(target - tmpSum) < abs(target - minDiffSum) ? tmpSum : minDiffSum
            }
        }
        
        return minDiffSum
    }
    
    class func test() {
        let input = [-65,-46,-10,-79,-86,39,40,62,31,-40,-80,-20,-6,8,38,-33,97,-99,-86,8,85,57,78,-92,10,5,84,-15,32,11,-15,-5,-56,86,47,-78,39,88,-86,24,-77,52,-55,16,22,-57,-39,-16,-32,-2,-94,-43,13,-49,77,96,35,-46,-47,10,-57,-73,95,-22,-22,5,-3,81,79,-15,-34,41,-91,26,-15,72,35,100,100,-89,-79,70,8,-99,-45,75,-57,15,34,-16,43,54,-99,39,-42,87,-88,-69,39,15,12,29,71,48,-51,20,-18,-37,95,-81,-71,22,56,-87,90,78,-57,-37,-17,-64,82,-28,-25,-83,75,21,97,35,67,12,55,-91,-63,4,-46,15,-19,-60,41,29,-71,26,25,-85,-15,-81,-53,48,31,28,88,-71,19,83,38,-42,-94,42,62,-43,90,-81,-60,56,-47,34,-60,73,-67,72,-99,-46,-47,10,46,-86,-42]
        
        print(threeSumClosest(input, 220))
    }
}
