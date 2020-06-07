//
//  Next Permutation.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 1/16/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Foundation

final class NextPermutationSolution {
    class func getPermutations(for inputString: String) -> Set<String> {
        guard inputString.count > 0 else { return Set() }
        guard inputString.count != 1 else { return Set<String>(arrayLiteral: inputString) }
        
        let lastChar = String(inputString.last!)
        let preLastIndex = inputString.index(before: inputString.endIndex)
        let allCharectersExceptLast = inputString[..<preLastIndex]
        
        let permutationsOfAllCharsExceptLast = getPermutations(for: String(allCharectersExceptLast))
        // [A] + B; [BA, AB] + C
        var permutations: [String] = []
        for permutationOfAll in permutationsOfAllCharsExceptLast {
            for position in 0...permutationOfAll.count {
                let startIndex = permutationOfAll.startIndex
                let index = permutationOfAll.index(startIndex, offsetBy: position)
                let permutation = String(permutationOfAll[..<index]) + lastChar + String(permutationOfAll[index...])
                permutations.append(permutation)
            }
        }
        
        return Set(permutations)
    }
    
    class func nextPermutation(_ nums: inout [Int]) {
        guard nums.count > 1 else { return }
        
        var res = naiveNextPermutation(nums)
        res = Array(Set(res))
        res = res.sorted{ $0.description < $1.description }
        let idx = res.index(after: res.firstIndex(of: nums)!)
        
        if idx < res.count {
            nums = res[idx]
        } else {
            nums = nums.sorted()
        }
        
    }
    
    class func naiveNextPermutation(_ nums: [Int]) -> [[Int]] {
        var results = [[Int]]()
        
        for num in nums {
          guard results.count != 0 else { results = [[num]]; continue }
            
            results = results.flatMap { (result) in
                (0...result.count).compactMap { (i) in
                    var result = result
                    result.insert(num, at: i)
                    return result
                }
            }
        }
        return results
    }
    
    class func test() {
        var input = [1,1,5]
        
        print(getPermutations(for: "115"))
        
        NextPermutationSolution.nextPermutation(&input)
        print("next is " + input.description)
        
        print(naiveNextPermutation(input))
        
    }
}
