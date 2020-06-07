//
//  Best Time to Buy and Sell Stock II.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 2/19/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Best_Time_to_Buy_and_Sell_Stock_II: NSObject {
  func maxProfitBuyOnes(_ prices: [Int]) -> Int {
      var minPrice = Int.max
      var maxProfit = 0
      
      for price in prices {
          if price < minPrice {
              minPrice = price
          } else if price - minPrice > maxProfit {
              maxProfit = price - minPrice
          }
      }
      
      return maxProfit
  }
    class func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 0 else { return prices.first ?? 0 }
        
        var profit = 0
        for ind in 1..<prices.count {
            if prices[ind] > prices[ind - 1] {
                profit += prices[ind] - prices[ind - 1]
            }
        }
        
        return profit
    }
    
    class func test() {
        let profit = maxProfit([7,1,5,3,6,4])
        print("profit should be 7, result is \(profit)")
    }
}
