//
//  main.swift
//  AddTwoNumbers
//
//  Created by Janiece Eleonor on 4/13/24.
//

import Foundation

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
//class Solution {
//    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//        var dummyHead = ListNode(0)
//        var currentNode = dummyHead
//        var carry = 0
//        var node1 = l1
//        var node2 = l2
//
//        while node1 != nil || node2 != nil {
//            let val1 = node1?.val ?? 0
//            let val2 = node2?.val ?? 0
//            let sum = val1 + val2 + carry
//            carry = sum / 10
//            currentNode.next = ListNode(sum % 10)
//            currentNode = currentNode.next!
//
//            node1 = node1?.next
//            node2 = node2?.next
//        }
//
//        if carry > 0 {
//            currentNode.next = ListNode(carry)
//        }
//
//        return dummyHead.next
//    }
//}

class Solution {
    func addTwoNumbers(_ l1: Array<Int>?, _ l2: Array<Int>?) -> Array<Int>? {
        var result: [Int] = []
        var carry = 0
        
        if let list1 = l1, let list2 = l2 {
            for (digit1, digit2) in zip(list1, list2) {
                let sum = digit1 + digit2 + carry
                carry = sum / 10
                result.append(sum % 10)
            }
        }
        
        return result
    }
}

let l1: Array<Int> = [2, 4, 3]
let l2: Array<Int> = [5, 6, 4]

let solution = Solution()
let result = solution.addTwoNumbers(l1, l2)

print(result)
