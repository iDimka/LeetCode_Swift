//
//  Fruit Into Baskets.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 1/16/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Foundation

class SolutionFruitIntoBaskets {
    class func totalFruit(_ tree: [Int]) -> Int {
        guard tree.isEmpty == false else { return 0 }
        
        var map = [Int: Int]()
        var maxValue = 1
        var i = 0
        var j = 0
        
        while j < tree.count - 1 {
            if map.keys.count <= 2 {
                j += 1
                map[tree[j]] = j
            }
            
            if map.keys.count > 2 {
                let minValue = map.values.min() ?? tree.count - 1
                                                
                i = minValue + 1
                map.removeValue(forKey: tree[minValue])
            }
            
            maxValue = max(maxValue, j - i)
        }
        
        return maxValue
    }
    
    class func test() {
        let input = [3,3,3, 1,2,1,1,2, 3,3,4] // has wrong answer on this input
        
        print(totalFruit(input))
    }
}
