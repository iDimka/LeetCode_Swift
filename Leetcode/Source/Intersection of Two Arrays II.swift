//
//  Intersection of Two Arrays II.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 2/19/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Intersection_of_Two_Arrays_II: NSObject {
    class func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        guard nums1.count > 0, nums2.count > 0 else { return [] }
        
        let nums1 = nums1.sorted()
        let nums2 = nums2.sorted()
        
        // print("\(nums1)\n\(nums2)")
        
        var ind1 = 0
        var ind2 = 0
        
        var result: [Int] = []
        
        while ind1 < nums1.count, ind2 < nums2.count {
            if nums1[ind1] > nums2[ind2] {
                // print("\(nums1[ind1]), \(nums2[ind2])+")
                ind2 += 1
            } else if nums1[ind1] < nums2[ind2] {
                // print("\(nums1[ind1])+, \(nums2[ind2])")
                ind1 += 1
            } else {
                print("\(nums1[ind1]) == \(nums2[ind2])")
                result.append(nums1[ind1])
                ind1 += 1
                ind2 += 1
            }
        }
        
        return result
    }
    
    class func test() {
        print(intersect([1,2,2,1], [2,2]))
    }
}
