//
//  Remove Duplicates from Sorted Array.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 2/19/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Remove_Duplicates_from_Sorted_Array: NSObject {
     class func removeDuplicates(_ nums: inout [Int]) -> Int {
            guard nums.count > 1 else { return nums.count }
            
            // let length = nums.count
            // var skipped = 0
            var index = 1
            
            while index < nums.count {
                if nums[index] == nums[index - 1] {
                    // skipped += 1
                    nums.remove(at: index)
                } else {
                    index += 1
                }
            }
            
            return nums.count
        }
    
    class func test() {
        var input = [1,1,2]
        let len = removeDuplicates(&input)
        print(input)
    }
}
