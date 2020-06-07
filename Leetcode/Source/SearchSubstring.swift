//
//  SearchSubstring.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 3/9/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class SearchSubstring {
    
    class func find(substring: String, in string: String) -> String.Index? {
        guard substring.count != string.count else {
            return substring == string ? string.startIndex : nil
        }
        
        for (ind, _) in string.enumerated() {
            var index = string.index(string.startIndex, offsetBy: ind)
            var found = true
            
            for (ind, _) in substring.enumerated() {
                let subIndex = substring.index(substring.startIndex, offsetBy: ind)
                
                if string.endIndex == index || string[index] != substring[subIndex] {
                    found = false
                    break
                } else {
                    index = string.index(after: index)
                }
            }
            
            if found {
                return string.index(string.startIndex, offsetBy: ind)
            }
        }
        
        return nil
    }
    
    class func test() {
        let input = "this is a_nice+test string"
        
        if let index = find(substring: "nice", in: input) {
            print(input[index])
        } else {
            print("not found 1")
        }
        
        print("---")
        
        if let index = input.findPattern("nice") {
            print(input[index])
        } else {
            print("not found 2")
        }
    }
}

extension String {
    func findPattern(_ pattern: String) -> String.Index? {
        for (idx, _) in self.enumerated() {
            var selfIndex = index(startIndex, offsetBy: idx)
            var found = false
            
            for (idx, _) in pattern.enumerated() {
                let patternIndex = pattern.index(pattern.startIndex, offsetBy: idx)
                
                if self[selfIndex] == pattern[patternIndex] {
                    found = true
                    selfIndex = index(after: selfIndex)
                } else {
                    found = false
                    break
                }
            }
            
            if found {
                return index(startIndex, offsetBy: idx)
            }
        }
        
        return nil
    }
}
