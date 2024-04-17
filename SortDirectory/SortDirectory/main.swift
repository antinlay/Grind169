//
//  main.swift
//  SortDirectory
//
//  Created by Janiece Eleonor on 4/17/24.
//

import Foundation

// Reading input
guard let n = Int(readLine()!), n > 1 && n < 100000 else {
    fatalError("Invalid input!")
}

var dirs = [String](repeating: "", count: n)
for i in 0..<n {
    dirs[i] = readLine()!
}

let sortedDirs = dirs.sorted()
var prevDir = ""
//print("")
for dir in sortedDirs {
    let indent: Int = dir.components(separatedBy: "/").count - 1
    print("".padding(toLength: indent * 2, withPad: " ", startingAt: 0) + dir.components(separatedBy: "/").last!)
    prevDir = dir
}
