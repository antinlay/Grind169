//
//  main.swift
//  MatrixTransposition
//
//  Created by Janiece Eleonor on 4/17/24.
//

import Foundation

class Solution {
    var matrix = [[Int]]()
    
    func rotateMatrix(_ matrix: [[Int]]) -> [[Int]] {
        guard !matrix.isEmpty else {
            return [[]] // Invalid operation for an empty matrix
        }
        
        let rowCount = matrix.count
        let colCount = matrix[0].count
        
        var result = Array(repeating: Array(repeating: 0, count: rowCount), count: colCount)
        
        for i in 0..<rowCount {
            for j in 0..<colCount {
                result[j][i] = matrix[i][j]
            }
        }
        
        // Reverse each row
        for i in 0..<colCount {
            result[i].reverse()
        }
        
        return result
    }
    
    func readingMatrix() {
        guard let input = readLine(), let n = Int(input.components(separatedBy: " ")[0]), let m = Int(input.components(separatedBy: " ")[1]) else {
            fatalError("Invalid input!")
        }
                
        for _ in 0..<n {
            guard let rowInput = readLine() else {
                fatalError("Invalid input!")
            }
            let row = rowInput.split(separator: " ").compactMap { Int($0) }
            if row.count != m {
                fatalError("Invalid input! Each row must contain \(m) elements.")
            }
            matrix.append(row)
        }
    }
}

let solution = Solution()

// Input matrix
solution.readingMatrix()

// Rotating the matrix
let rotatedMatrix = solution.rotateMatrix(solution.matrix)

// Printing the result
for row in rotatedMatrix {
    print(row.map { String($0) }.joined(separator: " "))
}

