//
//  787.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 5/1/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Cheapest_Flights_Within_K_Stops_787: NSObject {
  struct Flight: Equatable {
    let start: Int
    let dest: Int
    let cost: Int
  }
  
  func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
    guard flights.count > 1 else { return -1 }
    
    var previousNode: [Int: Int] = [:]
    var minDistance: [Int: Int] = flights.reduce([Int: Int]()) { (result, value) in
      var result = result
      let cost: Int = value[1]
      result[cost] = Int.max
      
      return result
    }
    minDistance[src] = 0
    
    var visited: [Flight] = []
    
    var toVisit: [Flight] = []
    
    for flight in flights {
      toVisit.append(Flight(start: flight[0],
                            dest: flight[1],
                            cost: flight[2]))
    }
    
    var queue: [(Flight, Int)] = toVisit.filter { $0.start == src }.map { ($0, 0) }
    
    while queue.isEmpty == false, let (flight, connections) = queue.first {
      queue.removeFirst()
      guard visited.contains(where: { $0 == flight }) == false else {
        continue
      }
      guard connections < K + 1 else {
        continue
      }
      
      visited.append(flight)
      toVisit.removeAll(where: { $0 == flight })

      queue += toVisit.filter { $0.start == flight.dest }.map { ( $0, connections + 1)}
      
      guard let min = minDistance[flight.dest], let startPrice = minDistance[flight.start], min > flight.cost else { continue }
      
      minDistance[flight.dest] = flight.cost + startPrice
      previousNode[flight.dest] = flight.start
    }
    
    return minDistance[dst] == Int.max ? -1 : minDistance[dst]!
  }
  
  class func test() {
    let solution = Cheapest_Flights_Within_K_Stops_787()
    let flights = [[0,1,100],[1,2,100],[0,2,500]]
    
    assert(solution.findCheapestPrice(flights.count, flights, 0, 2, 0) == 500, "wrong result")
    assert(solution.findCheapestPrice(flights.count, flights, 0, 2, 1) == 200, "wrong result")
    
//    Doesn't work correctly on this input
//    let flights = [[3,4,4],[2,5,6],[4,7,10],[9,6,5],[7,4,4],[6,2,10],[6,8,6],[7,9,4],[1,5,4],[1,0,4],[9,7,3],[7,0,5],[6,5,8],[1,7,6],[4,0,9],[5,9,1],[8,7,3],[1,2,6],[4,1,5],[5,2,4],[1,9,1],[7,8,10],[0,4,2],[7,2,8]]
//    let result = solution.findCheapestPrice(flights.count, flights, 6, 0, 7)
    
  }
}
