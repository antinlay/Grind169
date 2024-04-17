//
//  main.swift
//  ValidParentheses
//
//  Created by Ляхевич Александр Олегович on 16.04.2024.
//

import Foundation

class Solution {
    func isValid(_ s: String) -> Bool {
        let dictionary: Dictionary<Character, Character> = [
            ")": "(",
            "]": "[",
            "}": "{"
        ]
        var stack: Array<Character> = []
        
        for char in s {
            if char == "}" || char == ")" || char == "]" {
                if stack.isEmpty || stack.last != dictionary[char] {
                    return false
                } else {
                    stack.removeLast()
                }
            } else {
                stack.append(char)
            }
        }
        return stack.isEmpty
    }
}

let solution = Solution()
let string = "()"

print(solution.isValid(string))

"(,"
