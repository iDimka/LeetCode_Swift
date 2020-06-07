//
//  Sort Colors.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 3/11/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Sort_Colors: NSObject {
    class func sortColors(_ nums: inout [Int]) {        
        var index  = 0
        var trailingTwos = 0
        
        while index < (nums.count - trailingTwos) {
            let num = nums[index]
            
            switch num {
            case 0:
                nums.remove(at: index)
                nums.insert(0, at: 0)
                index += 1
            case 1:
                index += 1
            case 2:
                nums.remove(at: index)
                nums.insert(2, at: nums.count)
                trailingTwos += 1
            default: break
            }
        }
    }
    
    class func test() {
        var input = [2,0,1,0]
        sortColors(&input)
        
        print("sorted: \(input)")
    }
}
