//
//  Is Graph Bipartite.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 6/3/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa
/*
 https://leetcode.com/explore/interview/card/facebook/52/trees-and-graphs/3028/

 Given an undirected graph, return true if and only if it is bipartite.

 Recall that a graph is bipartite if we can split it's set of nodes into two independent subsets A and B such that every edge in the graph has one node in A and another node in B.

 The graph is given in the following form: graph[i] is a list of indexes j for which the edge between nodes i and j exists.  Each node is an integer between 0 and graph.length - 1.  There are no self edges or parallel edges: graph[i] does not contain i, and it doesn't contain any element twice.

 Example 1:
 Input: [[1,3], [0,2], [1,3], [0,2]]
 Output: true
 Explanation:
 The graph looks like this:
 0----1
 |    |
 |    |
 3----2
 We can divide the vertices into two groups: {0, 2} and {1, 3}.
 Example 2:
 Input: [[1,2,3], [0,2], [0,1,3], [0,2]]
 Output: false
 Explanation:
 The graph looks like this:
 0----1
 | \  |
 |  \ |
 3----2
 We cannot find a way to divide the set of nodes into two independent subsets.


 Note:

 graph will have length in range [1, 100].
 graph[i] will contain integers in range [0, graph.length - 1].
 graph[i] will not contain i or duplicate values.
 The graph is undirected: if any element j is in graph[i], then i will be in graph[j].
 */
class Is_Graph_Bipartite: NSObject {
  enum Colors {
    case red
    case blue
    case uncolored

    var toggled: Colors {
      switch self {
      case .red: return .blue
      case .blue: return .red
      case .uncolored: assert(false)
      }
    }
  }

  func isBipartite_DFS_Recursive(_ graph: [[Int]]) -> Bool {
    guard graph.isEmpty == false else { return false }

    let color = Colors.red
    var visited = [Colors](repeating: .uncolored, count: graph.count)

    for index in 0..<graph.count where visited[index] == .uncolored {
      guard dfs(graph, node: index, color: color, visited: &visited) else {
        return false
      }
    }

    return true
  }

  func dfs(_ graph: [[Int]], node: Int, color: Colors, visited: inout [Colors]) -> Bool {
    guard visited[node] == .uncolored else { return visited[node] == color }

    visited[node] = color

    for nodeTo in graph[node] {
      guard dfs(graph, node: nodeTo, color: color.toggled, visited: &visited) else { return false }
    }

    return true
  }

  func isBipartite_DFS_Iteractive(_ graph: [[Int]]) -> Bool {
    guard graph.isEmpty == false else { return false }

    var visited = [Int](repeating: -1, count: graph.count)

    for node in 0..<graph.count where visited[node] == -1 {
      var stack: [Int] = [node]
      visited[node] = 0

      while stack.isEmpty == false {
        let node = stack.removeFirst()

        for neighbor in graph[node] {
          if visited[neighbor] == -1 {
            stack.append(neighbor)
            visited[neighbor] = visited[node] ^ 1
          } else if visited[neighbor] != (visited[node] ^ 1) {
            return false
          }
        }
      }
    }
    return true
  }

  class func test() {
    let input = [[1,3],[0,2],[1,3],[0,2]]
    print(Is_Graph_Bipartite().isBipartite_DFS_Recursive(input))
  }
}
