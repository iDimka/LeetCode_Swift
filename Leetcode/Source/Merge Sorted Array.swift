//
//  Merge Sorted Array.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 5/30/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa
/*
 https://leetcode.com/explore/interview/card/facebook/5/array-and-strings/309/

 Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.

 Note:

 The number of elements initialized in nums1 and nums2 are m and n respectively.
 You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2.
 Example:

 Input:
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3

 Output: [1,2,2,3,5,6]
    Hide Hint #1
 You can easily solve this problem if you simply think about two elements at a time rather than two arrays. We know that each of the individual arrays is sorted. What we don't know is how they will intertwine. Can we take a local decision and arrive at an optimal solution?
    Hide Hint #2
 If you simply consider one element each at a time from the two arrays and make a decision and proceed accordingly, you will arrive at the optimal solution.
 */
class Merge_Sorted_Array: NSObject {
  func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var leftInd = m - 1
        var rightInd = n - 1
        var currentInd = nums1.count - 1

        while leftInd >= 0, rightInd >= 0 {
            nums1[currentInd] = nums1[leftInd] > nums2[rightInd] ? nums1[leftInd] : nums2[rightInd]
            nums1[leftInd] > nums2[rightInd] ? (leftInd -= 1) : (rightInd -= 1)
            currentInd -= 1
        }
        // (2)0 & (1)
        // ()22 & (1)
        while rightInd >= 0 {
            nums1[currentInd] = nums2[rightInd]
            currentInd -= 1
            rightInd -= 1
        }
    }
}
