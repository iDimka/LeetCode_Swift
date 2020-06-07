//
//  Best Time to Buy and Sell Stock.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 3/15/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Best_Time_to_Buy_and_Sell_Stock: NSObject {
    class func maxProfit(_ prices: [Int]) -> Int {
        var firstBuy = Int.min
        var secondBuy = Int.min
        
        var firstSell = 0
        var secondSell = 0
        
        for price in prices {
            firstBuy = max(firstBuy, -price)
            firstSell = max(firstSell, firstBuy + price)
            
            secondBuy = max(secondBuy, firstSell - price)
            secondSell = max(secondSell, secondBuy + price)
        }
        
        return secondSell
    }
    
    class func test() {
        let input = [3,3,5,0,0,3,1,4]
        
        print(maxProfit(input))
    }
}
