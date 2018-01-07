/*
 * [23] Merge k Sorted Lists
 *
 * https://leetcode.com/problems/merge-k-sorted-lists/description/
 *
 * algorithms
 * Hard (27.90%)
 * Total Accepted:    193.1K
 * Total Submissions: 692.1K
 * Testcase Example:  '[]'
 *
 * 
 * Merge k sorted linked lists and return it as one sorted list. Analyze and
 * describe its complexity.
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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var queue = PriorityQueue<ListNode>()
    
        lists.flatMap { $0 }.forEach { queue.insert($0) }
        
        guard queue.isEmpty == false else { return nil }
        
        var start: ListNode? = queue.pop()!
        var prev: ListNode? = start
        
        if let tail = start!.next {
                queue.insert(tail)
        }
        while !queue.isEmpty { 
            let head = queue.pop()!
            if let tail = head.next {
                queue.insert(tail)
                head.next = nil
            }
            prev!.next = head
            prev = head
            
        }
        return start        
    }
}

extension ListNode: Comparable {}

extension ListNode: CustomStringConvertible {
    public var description: String {
        if let n = next {
            return "(\(val)) -> " + n.description
        } else {
            return "(\(val))"
        }
    }
}   

public func >(l: ListNode, r: ListNode) -> Bool {
    return l.val > r.val
}

public func <(l: ListNode, r: ListNode) -> Bool {
    return l.val < r.val
}
public func ==(l: ListNode, r: ListNode) -> Bool {
    return l.val == r.val
}
class PriorityQueue<T: Comparable> {
    
    var array: [T] = []
    
    init() {
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    func leftOf(_ index: Int) -> Int {
        return index * 2 + 1
    }
    
    func rightOf(_ index: Int) -> Int {
        return leftOf(index) + 1
    }
    
    func parentOf(_ index: Int) -> Int {
        return (index - 1) / 2 
    }
    
    
    func insert(_ value: T) {
        array.append(value)
        fixUp(array.count - 1)
    }
    
    func fixUp(_ index: Int) {
        let parentIndex = parentOf(index) 
        guard parentIndex >= 0 else { return }
        if array[index] < array[parentIndex] {
            array.swapAt(index, parentIndex)
            fixUp(parentIndex)
        }
    }
    
    func fixDown(_ index: Int) {
        guard index >= 0 else { return }
        guard index < array.count else { return }
        
        var minIndex = index 
        if leftOf(index) < array.count && array[minIndex] > array[leftOf(index)] {
            minIndex = leftOf(index)
            
        } 
        if rightOf(index) < array.count && array[minIndex] > array[rightOf(index)] {
            minIndex = rightOf(index)
        }
        
        if minIndex == index { return }
        array.swapAt(minIndex, index)
        fixDown(minIndex)
    }
    
    
    func pop() -> T? {
        guard array.count > 0 else { return nil }

        let v = array[0]
        array.remove(at: 0)
        if let last =  array.popLast() {
            array.insert(last, at: 0)
            fixDown(0)
        }
        
        return v
    }
}
