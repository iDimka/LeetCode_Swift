//
//  main.swift
//  Leetcode
//
//  Created by Dzmitry Sazanovich on 6/7/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Foundation

AmazonVideo.test() // work through

/*
 to study again
 4.8 s4
 4.9
 4.12 s2
 */
extension String {
  func charAt(_ index: Int) -> Character? {
    guard index < count else { return nil }

    return self[self.index(self.startIndex, offsetBy: index)]
  }
}

extension Substring {
  var stringValue: String { return String(self) }
}
