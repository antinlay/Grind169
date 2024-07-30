//
//  main.swift
//  GenerateParenthesesSequence
//
//  Created by Janiece Eleonor on 7/30/24.
//

import Foundation

func generateParentheses(_ n: Int) {
    var result = [String]()
    generateParenthesesHelper(&result, "", 0, 0, n)
    for sequence in result {
        print(sequence)
    }
}

func generateParenthesesHelper(_ result: inout [String], _ current: String, _ open: Int, _ close: Int, _ max: Int) {
    if current.count == max * 2 {
        result.append(current)
        return
    }
    
    if open < max {
        generateParenthesesHelper(&result, current + "(", open + 1, close, max)
    }
    
    if close < open {
        generateParenthesesHelper(&result, current + ")", open, close + 1, max)
    }
}

// Чтение входного значения
if let nString = readLine(), let n = Int(nString) {
    generateParentheses(n)
}
