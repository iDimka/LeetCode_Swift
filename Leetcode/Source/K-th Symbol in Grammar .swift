//
//  K-th Symbol in Grammar .swift
//  LeetCodeMedium
//
//  Created by Dmitry Sazanovich on 1/14/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Foundation

class SolutionKthGrammar {
    class public func kthGrammar(_ N: Int, _ K: Int) -> Int {
        if (N == 1) {
            return 0
        }

        let r1 = (K + 1) / 2;
        let r2 = (K + 1) % 2;
        let prev = kthGrammar(N - 1, r1);
        return prev == 0 ? (r2 == 0 ? 0 : 1) : (r2 == 0 ? 1 : 0);
    }
    
    class func test() {
        print(SolutionKthGrammar.kthGrammar(3, 2))
    }
}
