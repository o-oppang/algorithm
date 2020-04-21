/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var currentL1 = l1
        var currentL2 = l2
        var ResultList = ListNode()
        var currentResultList = ResultList
        var overflowFlag = false
        while true {
            let l1Val = currentL1?.val ?? 0
            let l2Val = currentL2?.val ?? 0
            var value = l1Val + l2Val
            if overflowFlag { value += 1 }
            overflowFlag = (Float(value) / 10.0 >= 1) ? true : false
            if overflowFlag { value = value % 10 }
            currentResultList.val = value
            currentL1 = currentL1?.next 
            currentL2 = currentL2?.next
            if currentL1 == nil && currentL2 == nil && !overflowFlag { break }
            let nextNode = ListNode()
            currentResultList.next = nextNode
            currentResultList = nextNode
        }
        return ResultList
    }
}

// Runtime: 36 ms, faster than 99.89% of Swift online submissions for Add Two Numbers.
// Memory Usage: 20.7 MB, less than 11.11% of Swift online submissions for Add Two Numbers.
