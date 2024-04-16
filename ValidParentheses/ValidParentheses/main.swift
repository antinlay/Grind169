//
//  main.swift
//  ValidParentheses
//
//  Created by Ляхевич Александр Олегович on 16.04.2024.
//

import Foundation

class Solution {
    enum Bracket {
        case roundOpen, roundClose, squareOpen, squareClose, curlyOpen, curlyClose
    }
        
    let brackets: [String.Element] = ["(", ")", "[", "]", "{", "}"]
    var status = [Bracket: (Int, Int)]()
    
    func isValid(_ s: String) -> Bool {
        var result: Bool = true
        
        for (index, char) in s.enumerated() {
            if !isBrackets(char) || !checkIndex() || !checkCount(index, s.count) {
                return false
            } else {
                updateStatus(index, char)
            }
        }
        
        return result
    }
    
    func isBrackets(_ char: String.Element) -> Bool {
        print(brackets.contains(char))
        return brackets.contains(char)
    }
    
    func isCloseBracketFirst(_ index: Int, _ char: String.Element) -> Bool {
        let closeBrackets: [String.Element] = [")", "]", "}"]
        return index == 0 && closeBrackets.contains(char)
    }
    
    func updateStatus(_ index: Int,_ char: String.Element) {
        switch char {
        case "(":
            status.updateValue((index, (status[.roundOpen]?.1 ?? 0) + 1), forKey: .roundOpen)
        case ")":
            status.updateValue((index, (status[.roundClose]?.1 ?? 0) + 1), forKey: .roundClose)
        case "[":
            status.updateValue((index, (status[.squareOpen]?.1 ?? 0) + 1), forKey: .squareOpen)
        case "]":
            status.updateValue((index, (status[.squareClose]?.1 ?? 0) + 1), forKey: .squareClose)
        case "{":
            status.updateValue((index, (status[.curlyOpen]?.1 ?? 0) + 1), forKey: .curlyOpen)
        case "}":
            status.updateValue((index, (status[.curlyClose]?.1 ?? 0) + 1), forKey: .curlyClose)
        default:
            return
        }
    }
    
    func checkIndex() -> Bool {
        if let left = status[.roundOpen], let right = status[.roundClose] {
            return left.0 < right.0
        } else if let left = status[.squareOpen], let right = status[.squareClose] {
            return left.0 < right.0
        } else if let left = status[.curlyOpen], let right = status[.curlyClose] {
            return left.0 < right.0
        } else {
            return true
        }
    }
    
    func checkCount(_ index: Int, _ count: Int) -> Bool {
        if index == count - 1 {
            if let left = status[.roundOpen], let right = status[.roundClose] {
                return left.1 == right.1
            } else if let left = status[.squareOpen], let right = status[.squareClose] {
                return left.1 == right.1
            } else if let left = status[.curlyOpen], let right = status[.curlyClose] {
                return left.1 == right.1
            } 
        }
        return true
    }
}

let solution = Solution()
let string = "(((((((){}[]"

print(solution.isValid(string))
