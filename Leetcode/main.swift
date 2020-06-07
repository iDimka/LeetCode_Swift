//
//  main.swift
//  Leetcode
//
//  Created by Dzmitry Sazanovich on 6/7/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Foundation

Subsets.test()

extension String {
  func charAt(_ index: Int) -> Character? {
    guard index < count else { return nil }

    return self[self.index(self.startIndex, offsetBy: index)]
  }
}

extension Substring {
  var stringValue: String { return String(self) }
}
