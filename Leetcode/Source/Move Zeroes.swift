//
//  Move Zeroes.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 2/16/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Move_Zeroes: NSObject {
    class func moveZeroes(_ nums: inout [Int]) {
        var zeroCount = 0
        var index = 0
        
        while index < nums.count {
            if nums[index] == 0 {
                nums.remove(at: index)
                zeroCount += 1
            } else {
                index += 1
            }
        }
        
        (0..<zeroCount).forEach { _ in
            nums.append(0)
        }
    }
    
    class func test() {
        var input = [0,1,0,3,12]
        moveZeroes(&input)
        print(input)
    }
}
