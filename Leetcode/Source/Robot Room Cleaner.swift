//
//  Robot Room Cleaner.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 3/29/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Cocoa

class Robot_Room_Cleaner: NSObject {
  class Robot {
    typealias Movement = (x: Int, y: Int)
    enum Direction {
      case left, right, top, bottom
      
      var movement: Movement {
        let movement: Movement
        
        switch self {
          case .left: movement = (-1, 0)
          case .right: movement = (1, 0)
          case .bottom: movement = (0, 1)
          case .top: movement = (0, -1)
        }
        
        return movement
      }
      
      func turnLeft() -> Direction  {
        let direction: Direction
        
        switch self {
          case .top: direction = .left
          case .left: direction = .bottom
          case .bottom: direction = .right
          case .right: direction = .top
        }
        
        return direction
      }
      
      func turnRight() -> Direction {
        let direction: Direction
        
        switch self {
          case .top: direction = .right
          case .left: direction = .top
          case .bottom: direction = .left
          case .right: direction = .bottom
        }
        
        return direction
      }
    }
    
    var direction = Direction.bottom
    var floorPlan: [[Int]]
    var position: CGPoint
    var notCleaned: Bool {
      return floorPlan.flatMap { $0 }.contains(1)
    }
    
    init(plan: [[Int]], startPosition: CGPoint) {
      floorPlan = plan
      position = startPosition
    }
    // returns true if next cell is open and robot moves into the cell.
    // returns false if next cell is obstacle and robot stays on the current cell.
    func move() -> Bool {
      let movement = direction.movement
      
      let newPosition = position.moveTo(x: movement.0, y: movement.y)
      guard (0..<floorPlan.count).contains(newPosition.x.intValue), (0..<floorPlan[0].count).contains(newPosition.y.intValue) else { return false }
      guard floorPlan[newPosition.x.intValue][newPosition.y.intValue] == 0 else { return false }
      
      position = newPosition
      
      return true
    }
    
    // Robot will stay on the same cell after calling turnLeft/turnRight.
    // Each turn will be 90 degrees.
    func turnLeft() {
      direction = direction.turnLeft()
    }
    
    func turnRight() {
      direction = direction.turnRight()
    }
    
    // Clean the current cell.
    func clean() {
      floorPlan[position.x.intValue][position.y.intValue] = 0
    }
  }
  
  func cleanRoom(robot: Robot) {
    guard robot.notCleaned else { return }
    
    robot.clean()
    while robot.move() {
      robot.clean()
    }
    robot.turnLeft()
    cleanRoom(robot: robot)
  }
  
  class func test() {
    let room = [
      [1,1,1,1,1,0,1,1],
      [1,1,1,1,1,0,1,1],
      [1,0,1,1,1,1,1,1],
      [0,0,0,1,0,0,0,0],
      [1,1,1,1,1,1,1,1]
    ]
    let robot = Robot(plan: room, startPosition: CGPoint(x: 1, y: 3))
    
    let cleaner = Robot_Room_Cleaner()
    cleaner.cleanRoom(robot: robot)
    
    dump(robot.floorPlan)
  }
}

extension CGPoint {
  func moveTo(x: Int, y: Int) -> CGPoint { return CGPoint(x: x + self.x.intValue, y: y + self.y.intValue) }
}

extension CGFloat {
  var intValue: Int { Int(self) }
}
