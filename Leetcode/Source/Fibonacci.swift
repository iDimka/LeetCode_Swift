//
//  Fibonacci.swift
//  LeetCodeMedium
//
//  Created by Dmitry Sazanovich on 1/7/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Foundation

class Solution {
    var cache: [Int: Int] = [:]
    
    func fib(_ N: Int) -> Int {
        guard [0, 1].contains(N) == false else { return N }
        
        if let cachedValue = cache[N] {
            return cachedValue
        }
        
        let result = fib(N - 1) + fib(N - 2)
        cache[N] = result
        
        return result
    }
}
