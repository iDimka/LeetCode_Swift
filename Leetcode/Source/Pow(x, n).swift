//
//  Pow(x, n) .swift
//  LeetCodeMedium
//
//  Created by Dim Sazanovich on 1/12/20.
//  Copyright © 2020 idimka. All rights reserved.
//

/*
 
 2 * 2 * 2 * 2 * 2
 *
 2 * 2 * 2 * 2 * 2
 
 */

import Foundation

class PowSolution {
    static var iteractions: Int = 0
    
    class func myPow(_ x: Double, _ n: Int) -> Double { iteractions += 1
        guard n != 0 else { return 1 }
        guard n > 0 else { return 1 / myPow(x, -n) }
        
        if Double(n).remainder(dividingBy: 2) == 0 {
            let result = myPow(x, n / 2)
            return result * result
        } else {
            return x * myPow(x, n - 1)
        }
    }
    
    class func test() {
        print(myPow(2, -2))
        print(myPow(2, 10))
        print(myPow(2, -5))
        print(myPow(1, 2147483648))
    }
}
