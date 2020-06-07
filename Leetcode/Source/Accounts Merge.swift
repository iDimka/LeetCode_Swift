//
//  Accounts Merge.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 5/3/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

class Accounts_Merge: NSObject {
  func accountsMergeDFS(_ accounts: [[String]]) -> [[String]] {

    var graph: [String: [String]] = [:] // [email: [neighbor emails]]
    var nameDict: [String: String] = [:] // [email: name]

    for account in accounts {
      let name = account[0]
      for i in 1..<account.count {
        nameDict[account[i]] = name

        guard i > 1 else { continue }
        // When i >= 2, we connect this email with previous email
        // both directions
        graph[account[i], default: []].append(account[i-1])
        graph[account[i-1], default: []].append(account[i])
      }
    } // for

    var visited: Set<String> = []
    var ans: [[String]] = []

    // Let's perform DFS

    for email in nameDict.keys {
      guard !visited.contains(email) else { continue }

      var emailList: [String] = []
      visited.insert(email)
      dfs(graph, email, &visited, &emailList)
      // After each dfs, we have a connected component of the graph called path
      // We add the name in front of this newly generated path
      emailList = [nameDict[email]!] + emailList.sorted()
      ans.append(emailList)
    }

    return ans
  }

  private func dfs(_ graph: [String: [String]], _ email: String, _ visited: inout Set<String>, _ emailList: inout [String]) {
    emailList.append(email)

    guard let nexts = graph[email] else { return }

    for next in nexts where !visited.contains(next) {
      visited.insert(next)
      dfs(graph, next, &visited, &emailList)
    }
  }

  func accountsMergeBFS(_ accounts: [[String]]) -> [[String]] {
    var graph: [String: [String]] = [:] // [email: [neighbor emails]]
    var nameDict: [String: String] = [:] // [email: name]

    // build graph
    for account in accounts {
      let name = account[0]
      nameDict[account[1]] = name
      for i in 2..<account.count {
        nameDict[account[i]] = name
        graph[account[1], default: []].append(account[i])
        graph[account[i], default: []].append(account[1])
      }
    }

    var visited: Set<String> = []
    var answer: [[String]] = []

    // Let's perform BFS
    for email in nameDict.keys {
      guard !visited.contains(email) else { continue }

      visited.insert(email)
      var emailList: [String] = [email]
      var queue: [String] = [email]

      while !queue.isEmpty {
        let currentEmail = queue.removeLast()
        guard let nextEmails = graph[currentEmail] else { continue }

        for next in nextEmails where !visited.contains(next) {
          visited.insert(next)
          emailList.append(next)
          queue.append(next)
        }
      }
      answer.append([nameDict[email]!] + emailList)
    }
    return answer
  }

  class func test() {
    let input = [["dima", "idimka@me.com", "dzmitry.sazanovich@gmail.com"],
                 ["dima", "idimka@me.com", "dzmmitrys@google.com"],
                 ["olga", "olga.valoschik@gmail.com", "ariadna.v@icloud.com"]
    ]
    let solution = Accounts_Merge()

    print(solution.accountsMergeBFS(input))
  }
}
