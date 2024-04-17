//
//  main.swift
//  SortDirectory
//
//  Created by Janiece Eleonor on 4/17/24.
//

import Foundation

// Структура для представления директории
struct Directory {
    var name: String
    var level: Int
    var children: [Directory]

    // Рекурсивная функция для вывода директорий с отступами
    func printDirectories() {
        print(String(repeating: "  ", count: level) + name)
        for child in children {
            child.printDirectories()
        }
    }
}

// Считывание числа директорий
guard let n = Int(readLine()!) else {
    fatalError("Invalid input!")
}

// Создание корневой директории
var root = Directory(name: "root", level: 0, children: [])

// Чтение путей к директориям и добавление их в структуру
for _ in 0..<n {
    guard let path = readLine() else {
        fatalError("Invalid input!")
    }
    let components = path.split(separator: "/").map { String($0) }
    var currentDir = root
    for i in 1..<components.count {
        let dirName = components[i]
        if let existingChild = currentDir.children.first(where: { $0.name == dirName }) {
            currentDir = existingChild
        } else {
            let newDir = Directory(name: dirName, level: currentDir.level + 1, children: [])
            currentDir.children.append(newDir)
            currentDir = newDir
        }
    }
}

// Сортировка директорий внутри каждого уровня
func sortDirectories(_ directory: inout Directory) {
    directory.children.sort(by: { $0.name < $1.name })
    for i in 0..<directory.children.count {
        sortDirectories(&directory.children[i])
    }
}

sortDirectories(&root)

// Вывод отсортированных директорий
root.printDirectories()
