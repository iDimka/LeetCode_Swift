//
//  Coins.swift
//  Leetcode
//
//  Created by Dzmitry Sazanovich on 6/14/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

class Coins: NSObject {

  func numberOfWays(amount: Int, coins: [Int]) -> Int {
    guard amount > 0 else { return 0 }
    var changes: [[Int]] = []
    var current: [Int] = []

    let result = numberOfWays3(amount: amount, coins: coins, index: 0, changes: &changes, current: &current)
    print(changes)
    return result
  }

  func numberOfWays4(amount: Int, coins: [Int], index: Int, changes: inout [[Int]], current: inout [Int]) -> Int {
    guard index < coins.count else { return 1 }

    let denom = coins[index]

    var result = 0

    for idx in 0..<amount/denom {
      let remaining = amount - denom * idx
      result += numberOfWays4(amount: remaining, coins: coins, index: index + 1, changes: &changes, current: &current)
    }

    return result
  }

  func numberOfWays3(amount: Int, coins: [Int], index: Int, changes: inout [[Int]], current: inout [Int]) -> Int {
    current.append(index)
    if amount == 0 {
      changes.append(current)
      current = []
      return 1
    } else if amount < 0 {
      current.removeLast()
      return 0
    }

    var ways = 0
    for coin in coins {
      ways += numberOfWays3(amount: amount - coin, coins: coins, index: coin, changes: &changes, current: &current)
    }

    return ways;
  }
  func numberOfWays2(amount: Int, coins: [Int], index: Int, changes: inout [[Int]]) -> Int {
    guard index < coins.count else { return 1 }

    let denomAmount = coins[index]
    var ways = 0

    for idx in 0..<amount/denomAmount {
      let amountRemaining = amount - idx * denomAmount
      ways += numberOfWays2(amount: amountRemaining, coins: coins, index: index + 1, changes: &changes)
    }

    return ways
  }

  func numberOfWays(amount: Int, coins: [Int], index: Int, changes: inout [[Int]]) -> Int {
    let denom = coins[index]
    let remainingAmount = amount - denom
    if remainingAmount == 0 {
      changes[changes.count - 1].append(denom)
      changes.append([])
      return 1
    } else if remainingAmount < 0 {
      return 0
    }

    var result = 0

    changes[changes.count - 1].append(denom)

    for idx in coins.indices {
      result += numberOfWays(amount: remainingAmount, coins: coins, index: idx, changes: &changes)
    }

    return result
  }

  class func test() {
    let coins = [1,2,3]

    print(Coins().numberOfWays(amount: 4, coins: coins))
  }
}
