//
//  Integer to English Words.swift
//  LeetCode
//
//  Created by Dzmitry Sazanovich on 5/30/20.
//  Copyright © 2020 Dzmitry Sazanovich. All rights reserved.
//

import Cocoa

class Integer_to_English_Words: NSObject {
  func one(_ num: Int) -> String {
    switch(num) {
    case 1: return "One";
    case 2: return "Two";
    case 3: return "Three";
    case 4: return "Four";
    case 5: return "Five";
    case 6: return "Six";
    case 7: return "Seven";
    case 8: return "Eight";
    case 9: return "Nine";
    default: return "?"
    }
  }

  func twoLessThan20(_ num: Int) -> String {
    switch(num) {
    case 10: return "Ten";
    case 11: return "Eleven";
    case 12: return "Twelve";
    case 13: return "Thirteen";
    case 14: return "Fourteen";
    case 15: return "Fifteen";
    case 16: return "Sixteen";
    case 17: return "Seventeen";
    case 18: return "Eighteen";
    case 19: return "Nineteen";
    default: return "?20?"
    }
    return "";
  }

  func ten(_ num: Int) -> String {
    switch(num) {
    case 2: return "Twenty";
    case 3: return "Thirty";
    case 4: return "Forty";
    case 5: return "Fifty";
    case 6: return "Sixty";
    case 7: return "Seventy";
    case 8: return "Eighty";
    case 9: return "Ninety";

    default: return "?10?"
    }
    return "";
  }

  func three(_ num: Int) -> String {
    var result = ""
    let hunreds = num / 100
    if hunreds > 0 {
      result += three(hunreds) + " Hundred "
    }
    let decas = (num - (hunreds * 100)) / 10
    let rest = (num - (hunreds * 100) - decas * 10)

    if rest > 9 && rest < 20 {
      result += twoLessThan20(rest)
      return result
    } else if decas > 0 {
      result += ten(decas)
    }
    if rest.remainderReportingOverflow(dividingBy: 10).partialValue > 0 {
      result += (decas > 0 ? " " : "") + one(rest.remainderReportingOverflow(dividingBy: 10).partialValue)
    }
    return result.trimmingCharacters(in: .whitespaces)
  }

  func numberToWords(_ num: Int) -> String {
    guard num != 0 else { return "zero" }

    let billion = num / 1_000_000_000
    let million = (num - billion * 1_000_000_000) / 1_000_000
    let thsousant = (num - billion * 1_000_000_000 - million * 1_000_000) / 1_000
    let handrid = (num - billion * 1_000_000_000 - million * 1_000_000 - thsousant * 1_000) / 100
    let rest = num.quotientAndRemainder(dividingBy: 100).remainder

    var result = ""

    if billion > 0 {
      result += three(billion) + " Billion "
    }
    if million > 0 {
      result += three(million) + " Million "
    }
    if thsousant > 0 {
      result += three(thsousant) + " Thousand "
    }
    if handrid > 0 {
      result += three(handrid) + " Hundred "
    }
    if rest > 0 {
      result += three(rest)
    }
    return result.trimmingCharacters(in: .whitespaces)
  }

  class func test() {
    print(Integer_to_English_Words().numberToWords(100000))
  }
}
