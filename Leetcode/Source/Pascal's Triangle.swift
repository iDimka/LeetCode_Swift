//
//  File.swift
//  LeetCodeMedium
//
//  Created by Dmitry Sazanovich on 1/5/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Foundation

class SolutionPascalTriangle {    
    var cache: [[Int]] = [[]]
    
    func generate(_ numRows: Int) -> [[Int]] {
        guard numRows > 0 else { return [] }
        
        cache = (1...numRows).map { [Int](repeating: 0, count: $0) }
        
        return (1...numRows).map { self.generate(for: $0) }
    }
    
    func generate(for row: Int) -> [Int] {
        return (1...row).map { self.generate(row: row, column: $0) }
    }
    
    func generate(row: Int, column: Int) -> Int {
        if row == 1 || row == 2 || column == 1 || column == row {
            return 1
        }
        
        let cachedResult = cache[row - 1][column - 1]
        if cachedResult != 0 {
            return cachedResult
        }
        
        let result = generate(row: row - 1, column: column - 1) + generate(row: row - 1, column: column)
        cache[row - 1][column - 1] = result
        
        return result
    }
}
