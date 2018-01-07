/*
 * [2] Add Two Numbers
 *
 * https://leetcode.com/problems/add-two-numbers/description/
 *
 * algorithms
 * Medium (28.23%)
 * Total Accepted:    413.7K
 * Total Submissions: 1.5M
 * Testcase Example:  '[2,4,3]\n[5,6,4]'
 *
 * You are given two non-empty linked lists representing two non-negative
 * integers. The digits are stored in reverse order and each of their nodes
 * contain a single digit. Add the two numbers and return it as a linked list.
 * 
 * You may assume the two numbers do not contain any leading zero, except the
 * number 0 itself.
 * 
 * 
 * Example
 * 
 * Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 * Output: 7 -> 0 -> 8
 * Explanation: 342 + 465 = 807.
 * 
 * 
 */
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
        return _addTwoNumbers(l1, l2, 0)
    }
    
    func _addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?, _ carry: Int) -> ListNode? {
                if l1 == nil && l2 == nil {
            if carry > 0 { return ListNode(carry) }
            return nil
        }
        let lval = l1?.val ?? 0
        let rval = l2?.val ?? 0
        let total = lval + rval + carry
        var node = ListNode( total % 10 )
        
        node.next = _addTwoNumbers(l1?.next, l2?.next, total >= 10 ? 1 : 0)
        return node
        
    }
}
