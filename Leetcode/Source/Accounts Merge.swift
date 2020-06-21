//
//  Accounts Merge.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 5/3/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa
/*

 721. Accounts Merge
 Medium

 Share
 Given a list accounts, each element accounts[i] is a list of strings, where the first element accounts[i][0] is a name, and the rest of the elements are emails representing emails of the account.

 Now, we would like to merge these accounts. Two accounts definitely belong to the same person if there is some email that is common to both accounts. Note that even if two accounts have the same name, they may belong to different people as people could have the same name. A person can have any number of accounts initially, but all of their accounts definitely have the same name.

 After merging the accounts, return the accounts in the following format: the first element of each account is the name, and the rest of the elements are emails in sorted order. The accounts themselves can be returned in any order.

 Example 1:

 Input:
 accounts = [["John", "johnsmith@mail.com", "john00@mail.com"], ["John", "johnnybravo@mail.com"], ["John", "johnsmith@mail.com", "john_newyork@mail.com"], ["Mary", "mary@mail.com"]]
 Output: [["John", 'john00@mail.com', 'john_newyork@mail.com', 'johnsmith@mail.com'],  ["John", "johnnybravo@mail.com"], ["Mary", "mary@mail.com"]]
 Explanation:
 The first and third John's are the same person as they have the common email "johnsmith@mail.com".
 The second John and Mary are different people as none of their email addresses are used by other accounts.
 We could return these lists in any order, for example the answer [['Mary', 'mary@mail.com'], ['John', 'johnnybravo@mail.com'],
 ['John', 'john00@mail.com', 'john_newyork@mail.com', 'johnsmith@mail.com']] would still be accepted.
 Note:

 The length of accounts will be in the range [1, 1000].
 The length of accounts[i] will be in the range [1, 10].
 The length of accounts[i][j] will be in the range [1, 30].
 */
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
