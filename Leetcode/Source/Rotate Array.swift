//
//  Rotate Array.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 2/16/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Foundation

class RotateArray {
    class func rotate(_ nums: inout [Int], _ k: Int) {
        let count = nums.count
        
        guard count > 1 else { return }
        let k = k.remainderReportingOverflow(dividingBy: nums.count).partialValue
            
        (0..<k).forEach { _ in
            nums.insert(nums[count - 1], at: 0)
            nums.removeLast()
        }
    }
    
//    class func rotateExpensive(_ nums: inout [Int], _ k: Int) {
//        var tmp = 0
//        var prev = 0
//
//        (0..<k).forEach { (shift) in
//            prev = nums.last!
//
//            (0..<nums.count/2).forEach { (index) in
//                tmp = nums[index]
//                nums[index] = prev
//                prev = tmp
//            }
//        }
//    }
    
    class func test() {
        var input = [1, 2, 3, 4, 5, 6]
        rotate(&input, 2)
        print(input)
    }
}
