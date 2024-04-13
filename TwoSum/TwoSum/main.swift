//
//  main.swift
//  TwoSum
//
//  Created by Janiece Eleonor on 4/13/24.
//

import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result: [Int] = []

        nums.enumerated().forEach { index, num  in
            if result.isEmpty {
                let difference = target - num
                if  let targetIndex = nums.firstIndex(of: difference), index != targetIndex {
                    result.append(contentsOf: [index, targetIndex].sorted())
                }
            } else {
                return
            }
        }
        return result
    }
}

let solution = Solution()
print(solution.twoSum([3, 3], 6))
