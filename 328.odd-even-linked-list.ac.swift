/*
 * [328] Odd Even Linked List
 *
 * https://leetcode.com/problems/odd-even-linked-list/description/
 *
 * algorithms
 * Medium (44.37%)
 * Total Accepted:    84K
 * Total Submissions: 189.2K
 * Testcase Example:  '[1,2,3,4,5,6,7,8]'
 *
 * Given a singly linked list, group all odd nodes together followed by the
 * even nodes. Please note here we are talking about the node number and not
 * the value in the nodes.
 * 
 * You should try to do it in place. The program should run in O(1) space
 * complexity and O(nodes) time complexity.
 * 
 * 
 * Example:
 * Given 1->2->3->4->5->NULL,
 * return 1->3->5->2->4->NULL.
 * 
 * 
 * Note:
 * The relative order inside both the even and odd groups should remain as it
 * was in the input. 
 * The first node is considered odd, the second node even and so on ...
 * 
 * 
 * Credits:Special thanks to @DjangoUnchained for adding this problem and
 * creating all test cases.
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

extension ListNode {
    func append(_ node: ListNode?) {
        var current: ListNode = self
        while current.next != nil {
            current = current.next!
        }
        current.next = node
    }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        return "(\(self.val))" + (self.next != nil ? " -> \(self.next!.description)": "")
    }
}

class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        
        
        var odds: ListNode? = nil
        var evens: ListNode? = nil
        odds?.next = nil
        evens?.next = nil
        var current = head
        while current != nil {
            let next = current!.next?.next
            let odd = current!
            let even = current!.next
            odd.next = nil
            even?.next = nil
            if let odds = odds {
                odds.append(odd)    
            } else {
              odds = odd  
            }
            
            if let evens = evens {
                evens.append(even)    
            } else {
                evens = even
            }
            
            current = next
        }
        odds?.append(evens)
        return odds
    }
}
