//
//  Unique Email Addresses.swift
//  Google Interview
//
//  Created by Dmitry Sazanovich on 1/16/20.
//  Copyright © 2020 idimka. All rights reserved.
//

import Foundation

class SolutionUniqueEmails {
    class func numUniqueEmails(_ emails: [String]) -> Set<String> {
        guard emails.isEmpty == false else { return Set() }
        
        let names = emails
//            .compactMap { value in
//            return value.components(separatedBy: "@").first
//        }
        .map { value in
            return value.replacingOccurrences(of: ".", with: "")
        }.compactMap { value in
            return value.components(separatedBy: "+").first
        }
        
        let setNames = Set(names)
        
        return setNames
    }
    
    class func test() {
        let input = ["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]
        print(numUniqueEmails(input))
    }
}
