//
//  BinarySearch.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 2/29/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

// Search in Rotated Sorted Array
class BinarySearch: NSObject {
    class func findIndex<T: Comparable>(of x: T, in array: [T]) -> Int {
        var left = 0
        var right = array.count - 1
        
        while right >= left {
            let guess = left + (right - left) / 2
            
            if array[guess] > x {
                right = guess - 1
            } else if array[guess] < x {
                left = guess + 1
            } else {
                return guess
            }
        }
        return -1
    }
    
    class func findRotation<T: Comparable>(in array: [T]) -> Int? {
        var left = 0, right = array.count - 1
        guard array[left] > array[right] else { return 0 }
            
        while left <= right {
            let pivot = (right + left) / 2
            if array[pivot] > array[pivot + 1] {
                return pivot + 1
            } else {
                if array[pivot] < array[left] {
                    right = pivot
                } else {
                    left = pivot
                }
            }
        }
        
        return nil
    }
    
    class func searcInRotatedArray<T: Comparable>(in array: [T], value: T) -> Int {
        guard array.count > 0 else { return -1 }
        guard let rotationPoint = findRotation(in: array) else { return -1 } // something went wrong
        
        if value == array[rotationPoint] {
            return rotationPoint
        } else if array[0] == value {
            return 0
        }
        
        if rotationPoint == 0 {
            return findIndex(of: value, in: array)
        } else if array[0] < value {
            return findIndex(of: value, in: array[0..<rotationPoint].array)
        } else {
            let result = findIndex(of: value, in: array[rotationPoint..<array.count].array)
            return result == -1 ? -1 : result + rotationPoint
        }
    }
    
    class func test() {
        let input = [0, 1, 2, 3, 4, 5, 6]
        print(BinarySearch.findIndex(of: 3, in: input))
//        
        let rotatedaArray = [4, 5, 6, 8, 0, 1, 2, 3]
        print(BinarySearch.findRotation(in: rotatedaArray) ?? -1)
//        
        print("Search rotated index")
        print(searcInRotatedArray(in: [5,1,3], value: 3))
        print(searcInRotatedArray(in: [4,5,6,7,0,1,2], value: 3))
        print(searcInRotatedArray(in: rotatedaArray, value: 0))
        print(searcInRotatedArray(in: rotatedaArray, value: 5))
    }
}

extension ArraySlice {
    var array: [Element] {
        return Array(self)
    }
}
