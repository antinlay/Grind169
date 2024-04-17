//
//  main.swift
//  GreedyAlgorithm
//
//  Created by Janiece Eleonor on 4/17/24.
//

import Foundation

func maxWhiteMushrooms(_ forest: [[Character]]) -> Int {
    let n = forest.count
    var maxMushrooms = 0
    
    for startColumn in 0..<3 {
        // If the starting cell is a white mushroom, we can collect it
        var mushrooms = (forest[0][startColumn] == "C") ? 1 : 0
        
        var currentRow = 0
        var currentColumn = startColumn
        
        while currentRow < n - 1 {
            // Check possible next moves
            let possibleMoves = [(1, -1), (1, 0), (1, 1)]
            
            var maxMushroomsInNextRow = 0
            var nextColumn = -1
            
            for move in possibleMoves {
                let nextRow = currentRow + move.0
                let nextCol = currentColumn + move.1
                
                // Check if the next move is within bounds and not a thorny bush
                if nextCol >= 0 && nextCol < 3 && forest[nextRow][nextCol] != "W" {
                    let mushroomsInNextCell = (forest[nextRow][nextCol] == "C") ? 1 : 0
                    if mushroomsInNextCell > maxMushroomsInNextRow {
                        maxMushroomsInNextRow = mushroomsInNextCell
                        nextColumn = nextCol
                    }
                }
            }
            
            // If there are no possible moves, break the loop
            if maxMushroomsInNextRow == 0 {
                break
            }
            
            mushrooms += maxMushroomsInNextRow
            currentRow += 1
            currentColumn = nextColumn
        }
        
        maxMushrooms = max(maxMushrooms, mushrooms)
    }
    
    return maxMushrooms
}

// Reading input
guard let n = Int(readLine()!) else {
    fatalError("Invalid input!")
}

var forest = [[Character]]()
for _ in 0..<n {
    guard let row = readLine()?.map({ $0 }) else {
        fatalError("Invalid input!")
    }
    forest.append(row)
}

// Finding the maximum number of white mushrooms
let result = maxWhiteMushrooms(forest)
print(result)


