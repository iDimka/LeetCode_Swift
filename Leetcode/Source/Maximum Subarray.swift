//
//  Maximum Subarray.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 3/15/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Maximum_Subarray: NSObject {
    class func summIn(_ nums: [Int], left: Int, right: Int, divider: Int) -> Int {
        if left == right {
            return nums[left]
        }
        
        var leftSubSum = Int.min
        var currentSum = 0
        for ind in stride(from: divider, to: left - 1, by: -1) { //TODO: change to direct range
//        for ind in left...divider {
            currentSum += nums[ind]
            leftSubSum = max(leftSubSum, currentSum)
        }
        
        var rightSubSum = Int.min
        currentSum = 0
        for num in nums[divider + 1..<right + 1] {
            currentSum += num
            rightSubSum = max(rightSubSum, currentSum)
        }
        
        return leftSubSum + rightSubSum
    }
    
    class func summIn(_ nums: [Int], left: Int, right: Int) -> Int {
        if left == right {
            return nums[left]
        }
        
        let divider = (left + right) / 2
        
        let leftSum = summIn(nums, left: left, right: divider)
        let rightSum = summIn(nums, left: divider + 1, right: right)
        let sumOfAll = summIn(nums, left: left, right: right, divider: divider)
        print("\(left):\(divider):\(right)")
        return max(leftSum, rightSum, sumOfAll)
    }
    
    class func maxSubArrayBacktrack(_ nums: [Int]) -> Int {
        return summIn(nums, left: 0, right: nums.count - 1)
    }
    
    class func test() {
        let input = [-2,1,-3,4,-1,2,1,-5,4]
        print(maxSubArrayBacktrack(input))
    }
}
