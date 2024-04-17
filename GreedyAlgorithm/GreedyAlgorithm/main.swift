//
//  main.swift
//  GreedyAlgorithm
//
//  Created by Janiece Eleonor on 4/17/24.
//

import Foundation

let n = Int(readLine()!)!
var grid = [[Character]](repeating: [Character](repeating: ".", count: 3), count: n)

for i in 0..<n {
    let row = readLine()!
    for j in 0..<3 {
        grid[i][j] = row[row.index(row.startIndex, offsetBy: j)]
    }
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: n)

for i in (0..<n).reversed() {
    for j in 0..<3 {
        if grid[i][j] == "C" {
            if i == n - 1 || (grid[i + 1][j] == "W" && grid[i + 1][safe: j - 1] == "W" && grid[i + 1][safe: j + 1] == "W") {
                dp[i][j] = 1
            } else {
                dp[i][j] = 1 + max(dp[i + 1][j], dp[i + 1][safe: j - 1]!, dp[i + 1][safe: j + 1]!)
            }
        }
    }
}

print(max(dp[0][0], dp[0][1], dp[0][2]))

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}



