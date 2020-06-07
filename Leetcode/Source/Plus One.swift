//
//  Plus One.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 2/19/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Plus_One: NSObject {
    class func plusOne(_ digits: [Int]) -> [Int] {
        guard digits.count > 0 else { return digits }
        
        var digits = digits
        digits[digits.count - 1] = digits[digits.count - 1] + 1
        
        var index = digits.count - 1
        var carry = 0
        
        while index >= 0 {
            let digit = digits[index]
            digits[index] = digit.remainderReportingOverflow(dividingBy: 10).partialValue + carry
            carry = digit / 10
            
            index -= 1
        }
        
        return digits
    }
    
    class func test() {
        let input = [9,9]
        print("expected [1, 0, 0], got \(plusOne(input))")
    }
}
