//
//  main.swift
//  Anagrams
//
//  Created by Janiece Eleonor on 7/30/24.
//

import Foundation

func areAnagrams(_ str1: String, _ str2: String) -> Int {
    // Если длины строк разные, они не могут быть анаграммами
    if str1.count != str2.count {
        return 0
    }
    
    let aUnicode = Int(Unicode.Scalar(unicodeScalarLiteral: "a").value)
    var dictionary = [Character: Int]()
    
    Array(repeating: 0, count: 26).indices.forEach { index in
        dictionary[Character(Unicode.Scalar(aUnicode + index)!)] = 0
    }

    // Увеличиваем счетчик для каждого символа в первой строке
    for char in str1 {
        dictionary[char]! += 1
    }

    // Уменьшаем счетчик для каждого символа во второй строке
    for char in str2 {
        dictionary[char]! += 1
    }

    // Если все счетчики равны нулю, строки являются анаграммами
    for element in dictionary {
        if element.value % 2 == 1 {
            return 0
        }
    }

    return 1
}

// Чтение входных данных
guard let str1 = readLine(), let str2 = readLine() else {
    fatalError("Invalid input")
}

// Вызов функции и вывод результата
let result = areAnagrams(str1, str2)
print(result)


