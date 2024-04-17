//
//  main.swift
//  BreadthFirstSearch
//
//  Created by Janiece Eleonor on 4/17/24.
//

import Foundation

struct Point {
    let x: Int
    let y: Int
}

// Function to check if the point is inside the board
func isInside(_ point: Point, _ n: Int) -> Bool {
    return point.x >= 0 && point.x < n && point.y >= 0 && point.y < n
}

// Function to find the minimum number of steps
func minSteps(_ board: [[Character]], _ n: Int) -> Int {
    // Directions for knight's move
    let knightMoves = [(2, 1), (1, 2), (-1, 2), (-2, 1), (-2, -1), (-1, -2), (1, -2), (2, -1)]
    // Directions for king's move
    let kingMoves = [(1, 1), (1, 0), (1, -1), (0, 1), (0, -1), (-1, 1), (-1, 0), (-1, -1)]
    
    // Queue for BFS
    var queue = [Point]()
    // Visited array to keep track of visited cells
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    
    // Find the starting position
    var startX = 0
    var startY = 0
    for i in 0..<n {
        for j in 0..<n {
            if board[i][j] == "S" {
                startX = i
                startY = j
                break
            }
        }
    }
    
    // Enqueue the starting position
    queue.append(Point(x: startX, y: startY))
    visited[startX][startY] = true
    
    // Number of steps
    var steps = 0
    
    // Perform BFS
    while !queue.isEmpty {
        // Increment steps
        steps += 1
        
        // Number of elements at current level
        let size = queue.count
        
        // Explore all nodes at current level
        for _ in 0..<size {
            let current = queue.removeFirst()
            
            // Check all possible moves
            for move in knightMoves + kingMoves {
                let nextX = current.x + move.0
                let nextY = current.y + move.1
                
                // Check if the next move is inside the board and not visited
                if isInside(Point(x: nextX, y: nextY), n) && !visited[nextX][nextY] {
                    // Check if the next cell has a transformation
                    if board[nextX][nextY] == "K" {
                        // Knight transformation
                        queue.append(Point(x: nextX, y: nextY))
                        visited[nextX][nextY] = true
                    } else if board[nextX][nextY] == "G" {
                        // King transformation
                        queue.append(Point(x: nextX, y: nextY))
                        visited[nextX][nextY] = true
                    } else if board[nextX][nextY] == "." {
                        // Empty cell, no transformation
                        queue.append(Point(x: nextX, y: nextY))
                        visited[nextX][nextY] = true
                    } else if board[nextX][nextY] == "F" {
                        // Found the destination
                        return steps
                    }
                }
            }
        }
    }
    
    // No path found
    return -1
}

// Reading input
guard let n = Int(readLine()!) else {
    fatalError("Invalid input!")
}

var board = [[Character]]()
for _ in 0..<n {
    guard let row = readLine()?.map({ $0 }) else {
        fatalError("Invalid input!")
    }
    board.append(row)
}

// Finding the minimum number of steps
let result = minSteps(board, n)
print(result)
