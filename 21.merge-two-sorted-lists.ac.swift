/*
 * [21] Merge Two Sorted Lists
 *
 * https://leetcode.com/problems/merge-two-sorted-lists/description/
 *
 * algorithms
 * Easy (39.80%)
 * Total Accepted:    295.2K
 * Total Submissions: 741.8K
 * Testcase Example:  '[1,2,4]\n[1,3,4]'
 *
 * Merge two sorted linked lists and return it as a new list. The new list
 * should be made by splicing together the nodes of the first two lists.
 * 
 * Example:
 * 
 * Input: 1->2->4, 1->3->4
 * Output: 1->1->2->3->4->4
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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil { return nil }
        if let l1 = l1, l2 == nil { return l1 }
        if let l2 = l2, l1 == nil { return l2 }
        
        if l1!.val < l2!.val {
            let node = ListNode(l1!.val)
            node.next = mergeTwoLists(l1!.next, l2)
            return node
        } else {
            let node = ListNode(l2!.val)
            node.next = mergeTwoLists(l1!, l2!.next)
            return node
        }
    }
}
