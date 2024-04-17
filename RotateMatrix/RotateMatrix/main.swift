//
//  main.swift
//  RotateMatrix
//
//  Created by Janiece Eleonor on 4/17/24.
//

import Foundation

func rotateMatrix(_ matrix: inout [[Int]], clockwise: Bool) -> [[Int]] {
    let n = matrix.count
    
    // Transpose the matrix
    for i in 0..<n {
        for j in i..<n {
            (matrix[i][j], matrix[j][i]) = (matrix[j][i], matrix[i][j])
        }
    }
    
    // Reflect the matrix horizontally or vertically
    if clockwise {
        for i in 0..<n {
            for j in 0..<(n/2) {
                (matrix[i][j], matrix[i][n-j-1]) = (matrix[i][n-j-1], matrix[i][j])
            }
        }
    } else {
        for i in 0..<(n/2) {
            for j in 0..<n {
                (matrix[i][j], matrix[n-i-1][j]) = (matrix[n-i-1][j], matrix[i][j])
            }
        }
    }
    
    return matrix
}

// Reading input
guard let input = readLine()?.split(separator: " "),
      let n = Int(input[0]),
      let direction = input.last,
      let clockwise = direction == "R" || direction == "L" ? direction == "R" : nil else {
    fatalError("Invalid input!")
}

var matrix = [[Int]]()
for _ in 0..<n {
    guard let row = readLine()?.split(separator: " ").compactMap({ Int($0) }) else {
        fatalError("Invalid input!")
    }
    matrix.append(row)
}

// Rotating the matrix in-place
let rotatedMatrix = rotateMatrix(&matrix, clockwise: clockwise)

// Printing the result
for row in rotatedMatrix {
    print(row.map { String($0) }.joined(separator: " "))
}


