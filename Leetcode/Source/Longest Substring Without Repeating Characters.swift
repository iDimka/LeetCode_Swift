//
//  Longest Substring Without Repeating Characters.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 2/13/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Longest_Substring_Without_Repeating_Characters {
    class func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 1 else { return s.count }
        
        var left = s.index(s.startIndex, offsetBy: 0)
        var right = s.index(s.startIndex, offsetBy: 0)
        let count = s.index(s.startIndex, offsetBy: s.count)
        var maxValue = 0
        var cache: Set<Character> = Set()
        
        while left < count, right < count {
            let rightChar = s[right]
            
            if cache.contains(rightChar) {
                cache.remove(s[left])
                print("char: \(rightChar) - has dupblicate")
                left = s.index(left, offsetBy: 1) // + 1
            } else {
                print("char: \(rightChar)")
                cache.insert(rightChar)
                right = s.index(right, offsetBy: 1)
                let distance = s.distance(from: left, to: right)
                maxValue = max(maxValue, distance)
            }
        }
        
        return maxValue
    }
    
    class func test() {
        print(lengthOfLongestSubstring("pwwkew"))
    }
}
