//
//  Search a 2D Matrix II.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 3/22/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Search_a_2D_Matrix_II: NSObject {
    struct Area {
        let left: Int; let bottom: Int; let right: Int; let top: Int
        
        var isValid: Bool {
            return top <= bottom && right >= left
        }
        
        var isZero: Bool {
            return top == bottom && left == right
        }
    }
    
    ///TODO: fix
    func searchMatrix(_ matrix: [[Int]], _ target: Int, _ area: Area) -> Bool {
        if matrix[0][0] > target || matrix[matrix.count - 1][matrix[0].count - 1] < target {
            return false
        }
        
        let pivotCol = area.left + (area.right - area.left) / 2
        var nextBorder = area.top
        
        while target > matrix[nextBorder][pivotCol], area.bottom > nextBorder {
            nextBorder += 1
            
            if matrix[nextBorder][pivotCol] == target {
                return true
            }
        }
                
        return searchMatrix(matrix, target,
                            Area(left: area.left, bottom: area.bottom, right: pivotCol - 1, top: nextBorder)
            ) ||
            searchMatrix(matrix, target,
                         Area(left: pivotCol + 1, bottom: area.bottom, right: area.right, top: nextBorder - 1)
        )
    }
    
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard matrix.count > 0 else { return false }
        guard matrix[0].count > 0 else { return false }
        
        let area = Area(left: 0,
                        bottom: matrix.count - 1,
                        right: matrix[0].count - 1,
                        top: 0)
        
        return searchMatrix(matrix,
                            target,
                            area)
    }
    
    class func test() {
        let input = [
            [1,   4,  7, 11, 15],
            [2,   5,  8, 12, 19],
            [3,   6,  9, 16, 22],
            [10, 13, 14, 17, 24],
            [18, 21, 23, 26, 30]
        ]
        
        let solution = Search_a_2D_Matrix_II()
        print(solution.searchMatrix(input, 5))
        print(solution.searchMatrix(input, 19))
        print(solution.searchMatrix(input, 21))
        print(solution.searchMatrix(input, 17))
        print(solution.searchMatrix(input, 100))
    }
}

extension ArraySlice {
    var arrayValue: [Element] {
        return Array(self)
    }
}
