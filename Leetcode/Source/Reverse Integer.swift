//
//  Reverse Integer.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 2/20/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Reverse_Integer: NSObject {
    class func reverse(_ x: Int) -> Int {
        guard x > 9 || x < -9 else {
            return x
        }
        
        var x = x
        var newX = 0
        
        while abs(x) > 0 {
            newX *= 10
            newX += x.remainderReportingOverflow(dividingBy: 10).partialValue
            if newX > Int32.max {
                newX = Int(Int32.max)
            }
            x /= 10
        }
        
        return newX
    }
    
    class func test() {
        print(reverse(1534236469))
    }
}
