//
//  main.swift
//  InterestingTrip
//
//  Created by Janiece Eleonor on 7/30/24.
//

import Foundation

// BFS
struct City {
    let x: Int
    let y: Int
}

func distance(_ city1: City, _ city2: City) -> Int {
    return abs(city1.x - city2.x) + abs(city1.y - city2.y)
}

func bfs(_ cities: [City], _ k: Int, _ start: Int, _ end: Int) -> Int {
    let n = cities.count
    var visited = Array(repeating: false, count: n)
    var queue = [(Int, Int)]() // (city index, distance)
    queue.append((start - 1, 0))
    visited[start - 1] = true

    while !queue.isEmpty {
        let (currentCity, currentDistance) = queue.removeFirst()

        if currentCity == end - 1 {
            return currentDistance
        }

        for nextCity in 0..<n {
            if !visited[nextCity] && distance(cities[currentCity], cities[nextCity]) <= k {
                visited[nextCity] = true
                queue.append((nextCity, currentDistance + 1))
            }
        }
    }

    return -1
}

func main() {
    guard let nString = readLine(), let n = Int(nString), n >= 2 && n <= 1000 else {
        return
    }

    var cities = [City]()
    for _ in 0..<n {
        guard let line = readLine(), let x = Int(line.split(separator: " ")[0]), let y = Int(line.split(separator: " ")[1]) else {
            return
        }
        cities.append(City(x: x, y: y))
    }

    guard let kString = readLine(), let k = Int(kString), k > 0 && k <= 2_000_000_000 else {
        return
    }

    guard let startEndString = readLine(), let start = Int(startEndString.split(separator: " ")[0]), let end = Int(startEndString.split(separator: " ")[1]), start >= 1 && start <= n, end >= 1 && end <= n else {
        return
    }

    let result = bfs(cities, k, start, end)
    print(result)
}

// Запуск функции
main()

