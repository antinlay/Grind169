//
//  main.swift
//  HeroOleg
//
//  Created by Janiece Eleonor on 4/17/24.
//

import Foundation

class Solution {
    var maxFives = 0
    var currentFives = 0
    var startIndex = 0
    var endIndex = 0
    
    func findMaxFives(_ grades: [Int], _ n: Int) {
        for i in 0..<n - 6 {
            let subArray = Array(grades[i...i+6])
            if !subArray.contains(where: { $0 == 2 || $0 == 3 }) {
                currentFives = subArray.filter { $0 == 5 }.count
                if currentFives > maxFives {
                    maxFives = currentFives
                    startIndex = i
                    endIndex = i + 6
                }
            }
        }
        print(maxFives == 0 ? -1 : maxFives)
    }
}
// Reading input
guard let n = Int(readLine()!), n > 1 && n < 100000 else {
    fatalError("Invalid input!")
}

guard let gradesString = readLine() else {
    fatalError("Invalid input!")
}

let grades = gradesString.split(separator: " ").compactMap { Int($0) }

// Ensure the number of grades matches the specified number 'n'
guard grades.count == n else {
    fatalError("Invalid input! Number of grades does not match specified count 'n'.")
}

// Ensure each grade is between 2 and 5
guard grades.allSatisfy({ (2...5).contains($0) }) else {
    fatalError("Invalid input! Grades must be between 2 and 5.")
}

let solution = Solution()

solution.findMaxFives(grades, n)
